import 'package:ceia_components/core/model/firebase_entity/profile_document.dart';
import 'package:ceia_components/core/model/value_object/permission.dart';
import 'package:ceia_components/core/repository/permission/permission_repository.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<CEIAResponse> readFromList(List<DocumentReference> permissionRefList) async {
    try {
      // Executa a obtenção de todos os documentos em paralelo
      final profileSnapshots = await Future.wait(
        permissionRefList.map((ref) => ref.get()),
      );

      // Filtra para garantir que os documentos existam
      final validProfiles = profileSnapshots.where((snapshot) => snapshot.exists).toList();

      // Converte os snapshots para objetos Profile
      final profiles = validProfiles.map((snapshot) => ProfileDocument.fromFirestore(snapshot)).toList();

      return CEIAResponse.success(data: profiles);
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao obter os perfis de permissões do usuário.');
    }
  }

  @override
  Future<CEIAResponse> readAll() async {
    try {
      final profileQuery = await _firestore.collection('perfil').orderBy('nome').get();

      // Filtra para garantir que os documentos existam
      final validProfiles = profileQuery.docs.where((snapshot) => snapshot.exists).toList();

      // Converte os snapshots para objetos Profile
      final profiles = validProfiles.map((snapshot) => ProfileDocument.fromFirestore(snapshot)).toList();

      return CEIAResponse.success(data: profiles);
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro desconhecido ao obter os perfís disponíveis no sistema.');
    }
  }

  @override
  Future<CEIAResponse> create(String name, List<Permission> permissionList) async {
    try {
      // Verifica se já existe um perfil com o mesmo nome
      final profileAlreadyExists = await _profileAlreadyExists(name);

      // Se já existir um perfil com o nome, retorna um erro
      if (profileAlreadyExists) {
        return CEIAResponse.error(message: 'Já existe um perfil com este nome, tente informar outro.');
      }

      // Converte a lista de permissões em um Map<String, String>
      final Map<String, String> permissoesMap = {
        for (var permission in permissionList) permission.name: permission.value,
      };

      // Adiciona o novo perfil ao Firestore
      await _firestore.collection('perfil').add({
        'nome': name.toUpperCase(),
        'permissoes': permissoesMap,
        'ativo': true,
      });

      return CEIAResponse.success(message: 'Perfil cadastrado com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro ao cadastrar o perfil.');
    }
  }

  @override
  Future<CEIAResponse> delete(DocumentReference<Object?> permissionRef) async {
    try {
      await permissionRef.delete();

      return CEIAResponse.success(message: 'Perfil excluído com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao excluir o perfil.');
    }
  }

  @override
  Future<CEIAResponse> update(ProfileDocument profileDocument) async {
    try {
      // Verifica se já existe um perfil com o mesmo nome
      final profileAlreadyExists = await _profileAlreadyExists(
        profileDocument.name,
        currentProfileId: profileDocument.id,
      );

      // Se já existir um perfil com o nome, retorna um erro
      if (profileAlreadyExists) {
        return CEIAResponse.error(message: 'Já existe um perfil com este nome, tente informar outro.');
      }

      await profileDocument.reference.update(profileDocument.toFirestore());

      return CEIAResponse.success(message: 'Perfil atualizado com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao atualizar o perfil.');
    }
  }

  Future<bool> _profileAlreadyExists(String name, {String? currentProfileId}) async {
    // Verifica se já existe um perfil com o mesmo nome
    final existingProfiles = await _firestore.collection('perfil').where('nome', isEqualTo: name).get();

    // Itera sobre os perfis existentes para verificar o ID
    for (var doc in existingProfiles.docs) {
      // Verifica se o ID é diferente do currentProfileId (se fornecido)
      if (doc.id != currentProfileId) {
        return true; // Retorna true se encontrar um perfil com o mesmo nome e ID diferente
      }
    }

    return false; // Retorna false se nenhum conflito for encontrado
  }
}
