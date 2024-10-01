part of 'locality_repository_impl.dart';

abstract class LocalityRepository {
  Future<CEIAResponse> getUfList({bool orderByName = false, bool keyAsCode = true});
  Future<CEIAResponse> getCitiesByUf(String ufCode, {bool orderByName = false, bool keyAsCode = true});
}
