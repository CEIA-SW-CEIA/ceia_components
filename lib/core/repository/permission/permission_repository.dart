import 'package:ceia_components/core/model/firebase_entity/profile_document.dart';
import 'package:ceia_components/core/model/value_object/permission.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PermissionRepository {
  Future<CEIAResponse> readFromList(List<DocumentReference> permissionRefList);
  Future<CEIAResponse> readAll();
  Future<CEIAResponse> create(String name, List<Permission> permissionList);
  Future<CEIAResponse> delete(DocumentReference permissionRef);
  Future<CEIAResponse> update(ProfileDocument profileDocument);
}
