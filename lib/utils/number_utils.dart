import 'package:intl/intl.dart';

class NumberUtils {
  static String formatCurrencyBrl(double value) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(value);
  }

  static double stringToDouble(String value) {
    return double.parse(value.replaceAll(',', '.'));
  }

  static String doubleToString(double value) {
    return value.toString().replaceAll('.', ',');
  }
}
