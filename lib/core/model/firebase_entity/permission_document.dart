import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PermissionDocument extends FirebaseEntity {
  final Map<String, String> permissions;

  PermissionDocument._({
    required super.id,
    required super.reference,
    required this.permissions,
  });

  factory PermissionDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>?;

    final permissionList = _getPermissionList(map);

    return PermissionDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      permissions: permissionList,
    );
  }

  static Map<String, String> _getPermissionList(Map<String, dynamic>? map) {
    // Se o mapa de permissões for nulo, retorna um mapa vazio.
    if (map == null) return {};

    // Converte cada valor do Map<String, dynamic> para String
    final permissionList = map.map((key, value) => MapEntry(
          key,
          value.toString(), // Converte o valor para String
        ));

    // Retorna o Map<String, String> resultante
    return permissionList;
  }
}
