part of 'project_aggregate_repository_impl.dart';

abstract class ProjectAggregateRepository {
  Future<CEIAResponse> getAllFromScholarshipHolder(String scholarshipHolderId);
}
