import 'package:ceia_components/core/model/firebase_entity/user_document.dart';
import 'package:ceia_components/core/repository/user/user_repository.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl extends UserRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<CEIAResponse> read(String uid) async {
    try {
      final userQuerySnapshot = await _firestore.collection('user').where('uid', isEqualTo: uid).get();

      if (userQuerySnapshot.docs.length > 1) {
        return CEIAResponse.error(
          message:
              'Parece que o seu usuário possui mais de um conjunto de um perfil pessoal atribuido, entre em contato com o suporte para mais informações.',
        );
      }

      final userSnapshot = userQuerySnapshot.docs.first;

      if (!userSnapshot.exists) {
        return CEIAResponse.error(message: 'Parece que os dados do usuário procurado não existem.');
      }

      final user = UserDocument.fromFirestore(userSnapshot);

      return CEIAResponse.success(data: user);
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro desconhecido ao obter os dados do usuário.');
    }
  }

  @override
  Future<CEIAResponse> create({
    required String uid,
    required List<DocumentReference> profileList,
    required bool active,
    required bool admin,
    required bool passportModule,
    required bool prospectionModule,
    required bool projectsModule,
    required bool subscriptionModule,
    required bool clientModule,
    required bool taskModule,
    required bool acessModule,
  }) async {
    try {
      final userMap = {
        'uid': uid,
        'perfis': profileList,
        'ativo': active,
        'administrativo': admin,
        'modulo_passaporte': passportModule,
        'modulo_prospeccao': prospectionModule,
        'modulo_projetos': projectsModule,
        'modulo_assinatura': subscriptionModule,
        'modulo_cliente': clientModule,
        'modulo_tarefas': taskModule,
        'modulo_acesso': acessModule,
      };

      await _firestore.collection('user').doc(uid).set(userMap);

      return CEIAResponse.success(data: _firestore.collection('user').doc(uid));
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro desconhecido ao criar o usuário.');
    }
  }

  @override
  Future<CEIAResponse> update(UserDocument userDocument) async {
    try {
      await userDocument.reference.update(userDocument.toFirestore());

      return CEIAResponse.success(message: 'Dados pessoais do usuário atualizados com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao atualizar os dados pessoais do usuário.');
    }
  }
}
