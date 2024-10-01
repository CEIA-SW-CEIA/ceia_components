import 'dart:convert';

import 'package:ceia_components/core/model/aggregate/user_aggregate.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils {
  CacheUtils._();

  static Future<void> saveUser(UserAggregate user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toCache()));
    } catch (e) {
      LoggerUtils.showError('error ao salvar: $e');
    }
  }

  static Future<UserAggregate?> loadUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJsonString = prefs.getString('user');

      if (userJsonString == null) return null;

      return UserAggregate.fromCache(jsonDecode(userJsonString));
    } catch (e) {
      LoggerUtils.showError('erro ao carregar: $e');
      return null;
    }
  }

  static Future<void> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      prefs.remove('user');
    } catch (e) {
      LoggerUtils.showError('erro ao limpar: $e');
    }
  }
}
