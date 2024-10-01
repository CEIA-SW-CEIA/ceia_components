import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/core/model/system_entity/profile.dart';
import 'package:ceia_components/core/model/system_entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDocument extends FirebaseEntity {
  final String uid;
  final List<DocumentReference> profileList;
  final bool active;
  final bool admin;
  final bool passportModule;
  final bool prospectionModule;
  final bool projectsModule;
  final bool subscriptionModule;
  final bool clientModule;
  final bool taskModule;
  final bool acessModule;

  UserDocument._({
    required super.id,
    required super.reference,
    required this.uid,
    required this.profileList,
    required this.active,
    required this.passportModule,
    required this.prospectionModule,
    required this.projectsModule,
    required this.subscriptionModule,
    required this.clientModule,
    required this.taskModule,
    required this.acessModule,
    required this.admin,
  });

  factory UserDocument.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    final profiles = _getProfileList(map);

    return UserDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      uid: map['uid'],
      profileList: profiles,
      active: map['ativo'] as bool,
      admin: map['administrativo'] as bool,
      passportModule: map['modulo_passaporte'] as bool,
      prospectionModule: map['modulo_prospeccao'] as bool,
      projectsModule: map['modulo_projetos'] as bool,
      subscriptionModule: map['modulo_assinatura'] as bool,
      clientModule: map['modulo_cliente'] as bool,
      taskModule: map['modulo_tarefas'] as bool,
      acessModule: map['modulo_acesso'] as bool,
    );
  }

  factory UserDocument.fromUserAndProfileList(User user, List<Profile> profileList) {
    final profileRefList = profileList.map((profile) => profile.reference).toList();

    return UserDocument._(
      id: user.id,
      reference: user.reference,
      uid: user.uid,
      profileList: profileRefList,
      active: user.isActive,
      admin: user.admin,
      passportModule: user.passportModule,
      prospectionModule: user.prospectionModule,
      projectsModule: user.projectsModule,
      subscriptionModule: user.subscriptionModule,
      clientModule: user.clientModule,
      taskModule: user.taskModule,
      acessModule: user.acessModule,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
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
  }

  static List<DocumentReference> _getProfileList(Map<String, dynamic> map) {
    // Obtem a lista de perfís conforme vieram do banco de dados.
    final profileDataList = map['perfis'] as List<dynamic>?;

    // Em caso de nulidade retorna uma lista vazia evitando quebra.
    if (profileDataList == null) return [];

    // Realiza o casting de cada item da lista para o tipo correto que é: [DocumentReference]
    final profileList = profileDataList.map((profile) => profile as DocumentReference).toList();

    // retorna a lista pronta e com o tipo correto [List<DocumentReference>]
    return profileList;
  }
}
