part of 'contract_repository_impl.dart';

abstract class ContractRepository {
  Future<CEIAResponse> get(DocumentReference contract);
  Future<CEIAResponse> getAllFilterScholarshipHolder(DocumentReference project, DocumentReference scholarshipHolder);
}
