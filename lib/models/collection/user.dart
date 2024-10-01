import 'package:ceia_components/models/collection/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends FirebaseCollection {
  List<DocumentReference> profiles;
  List<String> permissions;
  List<DocumentReference> projects;
  bool active;
  bool admin;
  bool passportModule;
  bool prospectionModule;
  bool projectsModule;
  bool tasksModule;
  bool clientModule;
  bool signModule;

  User({
    required super.id,
    required super.docRef,
    required this.profiles,
    required this.permissions,
    required this.projects,
    required this.active,
    required this.admin,
    required this.passportModule,
    required this.prospectionModule,
    required this.projectsModule,
    required this.tasksModule,
    required this.clientModule,
    required this.signModule,
  });

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return User(
      id: snapshot.id,
      docRef: snapshot.reference,
      profiles: data['perfis'] as List<DocumentReference>,
      permissions: data['permissoes'] as List<String>,
      projects: data['projetos'] as List<DocumentReference>,
      active: data['ativo'] as bool,
      admin: data['administrador'] as bool,
      passportModule: data['modulo_passaporte'] as bool,
      prospectionModule: data['modulo_prospecao'] as bool,
      projectsModule: data['modulo_projetos'] as bool,
      tasksModule: data['modulo_tarefas'] as bool,
      clientModule: data['modulo_assinatura'] as bool,
      signModule: data['modulo_cliente'] as bool,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'perfis': profiles,
      'permissoes': permissions,
      'projetos': projects,
      'ativo': active,
      'administrador': admin,
      'modulo_passaporte': passportModule,
      'modulo_prospecao': prospectionModule,
      'modulo_projetos': projectsModule,
      'modulo_tarefas': tasksModule,
      'modulo_assinatura': clientModule,
      'modulo_cliente': signModule,
    };
  }
}
