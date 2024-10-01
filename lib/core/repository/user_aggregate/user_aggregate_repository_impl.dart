import 'package:ceia_components/core/model/aggregate/user_aggregate.dart';
import 'package:ceia_components/core/model/firebase_entity/person_document.dart';
import 'package:ceia_components/core/model/firebase_entity/profile_document.dart';
import 'package:ceia_components/core/model/firebase_entity/user_document.dart';
import 'package:ceia_components/core/model/system_entity/person.dart';
import 'package:ceia_components/core/model/system_entity/profile.dart';
import 'package:ceia_components/core/model/system_entity/user.dart';
import 'package:ceia_components/core/repository/permission/permission_repository_impl.dart';
import 'package:ceia_components/core/repository/person/person_repository_impl.dart';
import 'package:ceia_components/core/repository/user/user_repository_impl.dart';
import 'package:ceia_components/core/repository/user_aggregate/user_aggregate_repository.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';

class UserAggregateRepositoryImpl extends UserAggregateRepository {
  final UserRepositoryImpl _userRepository;
  final PersonRepositoryImpl _personRepository;
  final PermissionRepositoryImpl _permissionRepository;

  UserAggregateRepositoryImpl(this._userRepository, this._personRepository, this._permissionRepository);

  @override
  Future<CEIAResponse> read(String uid) async {
    try {
      // Consulta o usuário
      final userResult = await _userRepository.read(uid);

      // Trata o erro de usuário se for o caso
      if (userResult.isError) {
        throw Exception(userResult.message);
      }

      // Obtém o documento de usuário mapeado
      UserDocument userDoc = userResult.data;

      // Consulta os perfís do usuário
      final profileResult = await _permissionRepository.readFromList(userDoc.profileList);

      // Trata o erro na obtenção dos perfís se for o caso
      if (profileResult.isError) {
        throw Exception(profileResult.message);
      }

      // Obtém a lista de documentos de perfís mapeados
      List<ProfileDocument> profileDocList = profileResult.data;

      // Consulta pessoa
      final personResult = await _personRepository.read(userDoc.id);

      // Trata o erro da consulta de pessoa se for o caso
      if (personResult.isError) {
        throw Exception(personResult.message);
      }

      // Obtém o documento de pessoa mapeado
      PersonDocument personDoc = personResult.data;

      // Converte os documentos de perfil para entidade de perfil do sistema
      final profileList = profileDocList.map((profileDoc) => Profile.fromDocument(profileDoc)).toList();

      // Com base nos obtidos documentos, obtém o agregado de usuário
      final userAggregate = UserAggregate.fromDependencies(
        User.fromDocument(userDoc),
        Person.fromDocument(personDoc),
        profileList,
      );

      // Retorna o agregado de usuário.
      return CEIAResponse.success(data: userAggregate);
    } catch (error) {
      // Em caso de erro, emite o log de erro no console
      LoggerUtils.showError(error);

      // Retorna a mensagem de erro obtida.
      return CEIAResponse.error(message: error.toString());
    }
  }
}
