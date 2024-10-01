import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/core/model/system_entity/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDocument extends FirebaseEntity {
  final String name;
  final Map<String, String> permissionList;
  final bool isAtive;

  ProfileDocument._({
    required super.id,
    required super.reference,
    required this.name,
    required this.permissionList,
    required this.isAtive,
  });

  factory ProfileDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    final permissionList = _getPermissionList(map);

    return ProfileDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      name: map['nome'],
      permissionList: permissionList,
      isAtive: map['ativo'],
    );
  }

  static Map<String, String> _getPermissionList(Map<String, dynamic> map) {
    // Tenta acessar o campo 'permissoes', que é um Map<String, dynamic>.
    final permissionDataList = map['permissoes'] as Map<String, dynamic>?;

    // Se o mapa de permissões for nulo, retorna um mapa vazio.
    if (permissionDataList == null) return {};

    // Converte cada valor do Map<String, dynamic> para String
    final permissionList = permissionDataList.map((key, value) => MapEntry(
          key,
          value.toString(), // Converte o valor para String
        ));

    // Retorna o Map<String, String> resultante
    return permissionList;
  }

  factory ProfileDocument.fromProfile(Profile profile) {
    return ProfileDocument._(
      id: profile.id,
      reference: profile.reference,
      name: profile.name,
      permissionList: {
        for (var permission in profile.permissionList) permission.name: permission.value,
      },
      isAtive: profile.isAtive,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name.toUpperCase(),
      'permissoes': permissionList,
      'ativo': isAtive,
    };
  }
}
