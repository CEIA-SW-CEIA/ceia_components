import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/core/model/firebase_entity/user_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends FirebaseEntity {
  final String uid;
  final bool isActive;
  final bool admin;
  final bool passportModule;
  final bool prospectionModule;
  final bool projectsModule;
  final bool subscriptionModule;
  final bool clientModule;
  final bool taskModule;
  final bool acessModule;

  User._({
    required super.id,
    required super.reference,
    required this.uid,
    required this.isActive,
    required this.passportModule,
    required this.prospectionModule,
    required this.projectsModule,
    required this.subscriptionModule,
    required this.clientModule,
    required this.taskModule,
    required this.acessModule,
    required this.admin,
  });

  factory User.fromDocument(UserDocument userDoc) {
    return User._(
      id: userDoc.id,
      reference: userDoc.reference,
      uid: userDoc.uid,
      isActive: userDoc.active,
      passportModule: userDoc.passportModule,
      prospectionModule: userDoc.prospectionModule,
      projectsModule: userDoc.projectsModule,
      subscriptionModule: userDoc.subscriptionModule,
      clientModule: userDoc.clientModule,
      taskModule: userDoc.taskModule,
      acessModule: userDoc.acessModule,
      admin: userDoc.admin,
    );
  }

  factory User.update({
    required User user,
    bool? isActive,
    bool? passportModule,
    bool? prospectionModule,
    bool? projectsModule,
    bool? subscriptionModule,
    bool? clientModule,
    bool? taskModule,
    bool? admin,
  }) {
    return User._(
      id: user.id,
      reference: user.reference,
      uid: user.uid,
      isActive: user.isActive,
      passportModule: user.passportModule,
      prospectionModule: user.prospectionModule,
      projectsModule: user.projectsModule,
      subscriptionModule: user.subscriptionModule,
      clientModule: user.clientModule,
      taskModule: user.taskModule,
      acessModule: user.acessModule,
      admin: user.admin,
    );
  }

  Map<String, dynamic> toCache() {
    return {
      'id': id,
      'reference': reference.path,
      'uid': uid,
      'isActive': isActive,
      'admin': admin,
      'passportModule': passportModule,
      'prospectionModule': prospectionModule,
      'projectsModule': projectsModule,
      'subscriptionModule': subscriptionModule,
      'clientModule': clientModule,
      'taskModule': taskModule,
      'acessModule': acessModule,
    };
  }

  factory User.fromCache(Map<String, dynamic> cache) {
    return User._(
      id: cache['id'],
      reference: FirebaseFirestore.instance.doc(cache['reference']),
      uid: cache['uid'],
      isActive: cache['isActive'],
      passportModule: cache['passportModule'],
      prospectionModule: cache['prospectionModule'],
      projectsModule: cache['projectsModule'],
      subscriptionModule: cache['subscriptionModule'],
      clientModule: cache['clientModule'],
      taskModule: cache['taskModule'],
      acessModule: cache['acessModule'],
      admin: cache['admin'],
    );
  }
}
