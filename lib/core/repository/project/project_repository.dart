part of 'project_repository_impl.dart';

abstract class ProjectRepository {
  Future<CEIAResponse> read(String uid);
  Future<CEIAResponse> readFromDocumentsReference(List<DocumentReference> projectsReference);
  Future<CEIAResponse> get(DocumentReference project);
  Future<CEIAResponse> getAllFilterScholarshipHolder(DocumentReference scholarshipHolder);
}
