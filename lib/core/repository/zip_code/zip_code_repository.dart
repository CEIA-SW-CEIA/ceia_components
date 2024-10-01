part of 'zip_code_repository_impl.dart';

abstract class ZipCodeRepository {
  Future<CEIAResponse> getAdressByZipCode(String zipCode);
}
