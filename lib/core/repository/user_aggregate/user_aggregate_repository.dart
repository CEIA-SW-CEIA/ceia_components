import 'package:ceia_components/models/ceia_response.dart';

abstract class UserAggregateRepository {
  Future<CEIAResponse> read(String uid);
}
