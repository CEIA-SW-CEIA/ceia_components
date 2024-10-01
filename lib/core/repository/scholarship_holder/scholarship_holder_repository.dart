part of 'scholarship_holder_repository_impl.dart';

abstract class ScholarshipHolderRepository {
  Future<CEIAResponse> create(
    ScholarshipHolderIdentification identification,
    EducationLevel educationLevel,
    Bank bank,
    Adress adress,
    CommonPersonInfo registrant,
    String relevantInformation,
    String ceiaObservation,
    String id,
  );

  Future<CEIAResponse> read(String id);
  Future<CEIAResponse> update(ScholarshipHolderDocument scholarshipHolderDocument);
}
