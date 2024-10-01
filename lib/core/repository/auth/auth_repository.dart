import 'package:ceia_components/models/ceia_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User> authenticateWithToken(String token);
  Future<CEIAResponse> logout();
}
