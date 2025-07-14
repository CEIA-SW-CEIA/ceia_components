import 'package:ceia_components/core/client/api_client.dart';
import 'package:ceia_components/model2/user.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:ceia_components/utils/routes_utils.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/web.dart' as web;

class AuthService {
  static const _tokenKey = 'jwt_token';

  final ApiClient apiClient;

  String? _token; // Cache em memória para acesso instantâneo

  CurrentUser? _currentUser;

  String? get token => _token;
  bool get isAuthenticated => _token != null;
  CurrentUser? get currentUser => _currentUser;

  AuthService({
    required this.apiClient,
  });

  /// Método de inicialização
  /// Ele orquestra a busca do token na ordem correta.
  Future<void> init() async {
    // 1. Tenta carregar o token do armazenamento persistente (caso de F5)
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);

    // 2. Se não achou no cache, tenta pegar da URL (primeiro acesso ao módulo)
    final tokenFromUrl = Uri.base.queryParameters['token'];
    if (tokenFromUrl != null && tokenFromUrl.isNotEmpty) {
      _token = tokenFromUrl;
      // 3. Salva o novo token e limpa a URL
      await _saveTokenToCache(tokenFromUrl);
      _cleanUrlToken();
    }

    if (_token != null) {
      _currentUser = await fetchCurrentUser();
    }
  }

  // Métodos privados para organizar a lógica
  Future<void> _saveTokenToCache(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  void _cleanUrlToken() {
    final uri = Uri.base;
    // Cria uma nova URI sem NENHUM query parameter
    final cleanUri = uri.replace(queryParameters: {});
    web.window.history.replaceState(null, '', cleanUri.toString());
  }

  // Método público para o logout
  Future<void> logout(Function() onFinish) async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    onFinish.call();
  }

  Future<CurrentUser> fetchCurrentUser() async {
    try {
      final response = await apiClient.get(
        '/api/me',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $_token",
          },
        ),
      );
      return CurrentUser.fromJson(response.data);
    } catch (e) {
      RoutesUtils.redirectToAuthModule();
      LoggerUtils.showError('Falha ao buscar dados do usuário: $e');
      throw Exception("Falha ao buscar dados do usuário: $e");
    }
  }
}
