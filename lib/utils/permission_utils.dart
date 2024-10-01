import 'package:ceia_components/core/model/system_entity/profile.dart';
import 'package:ceia_components/core/model/value_object/permission.dart';
import 'package:collection/collection.dart';

class PermissionUtils {
  /// Dado o perfil de um usuário e uma funcionalidade do sistema, valida se o usuário tem permissão para a funcionalidade.
  /// Parametros:
  /// - [profile] representa o perfil contendo as permissões de acesso de um usuário;
  /// - [feature] representa a funcionalidade do sistema que se tenta acessar;
  /// Retorno:
  /// - [null] caso o usuário não tenha permissão para acessar a funcionalidade;
  /// - [Permission] caso o usuário tenha permissão para acessar a funcionalidade;
  static Permission? checkPermission(List<Profile> profileList, String feature) {
    for (var profile in profileList) {
      // Verifica se o perfil é ativo, se não for o usuário não possui permissão alguma.
      if (!profile.isAtive) {
        return null;
      }

      // Obtem, se estiver contido na lista, a permissão conforme a funcionalidade recebida no parametro [feature].
      final permission = profile.permissionList.firstWhereOrNull(
        (element) => element.name.toUpperCase() == feature.toUpperCase(),
      );

      // Retorna a permissão sendo:
      // Caso [permission == nulo]: o usuário não possui permissão.
      // Caso [permission != nulo]: o usuário possui permissão.
      // (caso possua permissão, no [permission.value] contém se é permissão de leitura (read) ou escrita (read_write))
      return permission;
    }
    return null;
  }
}
