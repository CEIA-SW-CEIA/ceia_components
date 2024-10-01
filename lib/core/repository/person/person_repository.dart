import 'package:ceia_components/core/model/firebase_entity/person_document.dart';
import 'package:ceia_components/models/ceia_response.dart';

abstract class PersonRepository {
  Future<CEIAResponse> read(String id);
  Future<CEIAResponse> readAll();
  Future<CEIAResponse> fetchByCpf(String cpf);
  Future<CEIAResponse> create({
    required String name,
    required String cpf,
    required String phone,
    required String email,
    required DateTime birthDayDate,
    required String id,
  });
  Future<CEIAResponse> update({required PersonDocument personDocument});
}
