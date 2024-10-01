import 'package:ceia_components/core/model/firebase_entity/user_document.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRepository {
  Future<CEIAResponse> read(String uid);
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
  });
  Future<CEIAResponse> update(UserDocument userDocument);
  //Future<CEIAResponse> updateUserProfiles( List<Profile> profileList);
}
