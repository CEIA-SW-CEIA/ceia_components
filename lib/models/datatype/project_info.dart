import 'package:ceia_components/models/collection/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectInfo {
  String title;
  DocumentReference project;
  DocumentReference? contract;

  ProjectInfo({required this.title, required this.project, this.contract});

  factory ProjectInfo.fromFirestore(Map<String, dynamic> data) {
    return ProjectInfo(
      title: data['titulo'],
      project: data['projeto'],
      contract: data['contrato'],
    );
  }

  factory ProjectInfo.fromProject(Project project) {
    return ProjectInfo(
      title: project.title,
      project: project.docRef!,
      contract: null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'titulo': title,
      'projeto': project,
      'contrato': contract,
    };
  }
}
