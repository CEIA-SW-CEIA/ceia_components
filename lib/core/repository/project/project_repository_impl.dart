import 'package:ceia_components/core/model/firebase_entity/project_document.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<CEIAResponse> read(String uid) async {
    try {
      final snapshot = await _firestore.collection('projeto').doc(uid).get();

      if (!snapshot.exists) {
        return CEIAResponse.error(message: 'Projeto não encontrado.');
      }

      return CEIAResponse.success(data: ProjectDocument.fromFirestore(snapshot));
    } catch (e) {
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar o projeto.');
    }
  }

  @override
  Future<CEIAResponse> get(DocumentReference project) async {
    try {
      final snapshot = await project.get();

      if (!snapshot.exists) {
        return CEIAResponse.error(message: 'Projeto não encontrado.');
      }

      return CEIAResponse.success(data: ProjectDocument.fromFirestore(snapshot));
    } catch (e) {
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar o projeto.');
    }
  }

  @override
  Future<CEIAResponse> getAllFilterScholarshipHolder(DocumentReference scholarshipHolder) async {
    try {
      final snapshots = await _firestore
          .collection('projeto')
          .where(
            'participantes',
            arrayContains: scholarshipHolder,
          )
          .get();

      if (snapshots.docs.isEmpty) {
        return CEIAResponse.success(data: [], message: 'Bolsista não possui projetos.');
      }

      final projects = snapshots.docs.map((project) => ProjectDocument.fromFirestore(project)).toList();

      return CEIAResponse.success(data: projects);
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar os projetos do bolsista.');
    }
  }
}
