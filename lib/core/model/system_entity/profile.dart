import 'package:ceia_components/core/model/firebase_entity/profile_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:ceia_components/core/model/value_object/permission.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends SystemEntity {
  final String name;
  final List<Permission> permissionList;
  final bool isAtive;

  Profile._({
    required super.id,
    required super.reference,
    required this.name,
    required this.permissionList,
    required this.isAtive,
  });

  factory Profile.fromDocument(ProfileDocument profileDoc) {
    final permissionList = _getPermissions(profileDoc.permissionList);

    return Profile._(
      id: profileDoc.id,
      reference: profileDoc.reference,
      name: profileDoc.name,
      permissionList: permissionList,
      isAtive: profileDoc.isAtive,
    );
  }

  static List<Permission> _getPermissions(Map<String, String> permissionDataList) {
    final permissionList = permissionDataList.entries
        .map((element) => Permission(
              name: element.key,
              value: element.value,
            ))
        .toList();

    return permissionList;
  }

  factory Profile.update({
    required Profile profile,
    String? name,
    List<Permission>? permissionList,
    bool? active,
  }) {
    return Profile._(
      id: profile.id,
      reference: profile.reference,
      name: name ?? profile.name,
      permissionList: permissionList ?? profile.permissionList,
      isAtive: active ?? profile.isAtive,
    );
  }

  Map<String, dynamic> toCache() {
    return {
      'id': id,
      'reference': reference.path,
      'name': name,
      'permissionList': permissionList.map((permission) => permission.toCache()).toList(),
      'isAtive': isAtive,
    };
  }

  factory Profile.fromCache(Map<String, dynamic> cache) {
    return Profile._(
      id: cache['id'],
      reference: FirebaseFirestore.instance.doc(cache['reference']),
      name: cache['name'],
      permissionList: (cache['permissionList'] as List).map((permission) => Permission.fromCache(permission)).toList(),
      isAtive: cache['isAtive'],
    );
  }
}
