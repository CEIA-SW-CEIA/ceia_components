import 'package:logger/logger.dart';

class LoggerUtils {
  LoggerUtils._();

  static void showError(dynamic message) {
    Logger().e('Houve um erro: $message');
  }

  static void showDebug(dynamic message) {
    Logger().d('Debug: $message');
  }
}
