import 'package:ceia_components/core/model/exception/auth_exception.dart';
import 'package:ceia_components/core/repository/auth/auth_repository.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> authenticateWithToken(String token) async {
    try {
      final result = await _firebaseAuth.signInWithCustomToken(token);

      if (result.user == null) {
        throw AuthException("Não foi possivel obter o usuário.");
      }

      return result.user!;
    } on AuthException catch (authError) {
      LoggerUtils.showError(authError);

      rethrow;
    } catch (error) {
      LoggerUtils.showError(error);

      throw Exception('Houve um erro desconhecido ao autenticar o usuário.');
    }
  }

  @override
  Future<CEIAResponse> logout() async {
    try {
      await _firebaseAuth.signOut();

      return CEIAResponse.success(message: 'Usuário deslogado com sucesso.');
    } catch (e) {
      return CEIAResponse.error(message: 'Houve um erro ao deslogar o usuário.');
    }
  }
}
