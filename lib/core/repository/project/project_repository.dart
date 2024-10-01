part of 'project_repository_impl.dart';

abstract class ProjectRepository {
  Future<CEIAResponse> read(String uid);
  Future<CEIAResponse> get(DocumentReference project);
  Future<CEIAResponse> getAllFilterScholarshipHolder(DocumentReference scholarshipHolder);
}
