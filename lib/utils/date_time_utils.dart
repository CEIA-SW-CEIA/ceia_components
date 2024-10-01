import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();

    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  static String formatDateTime(DateTime? date) {
    if (date == null) return 'Não informado...';

    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Converte um [DateTime] para uma [String] no formato "dd/MM/yyyy HH:mm:ss".
  static String formatFormatDateAndTime(DateTime? date) {
    if (date == null) return 'Não informado...';

    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  /// Converte uma [String] para um [DateTime].
  /// A [String] precisa estar no formato "dd/MM/yyyy HH:mm:ss".
  static DateTime DateAndTimeStringToDateTime(String date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').parse(date);
  }

  static DateTime timestampToDateTime(Timestamp timestamp) {
    return DateFormat('dd/MM/yyyy').parse(formatTimestamp(timestamp));
  }

  static Timestamp toTimestamp(String date) {
    final DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);

    return Timestamp.fromDate(parsedDate);
  }

  static DateTime stringToDateTime(String date) {
    final day = int.parse(date.substring(0, 2));
    final month = int.parse(date.substring(3, 5));

    if (day < 1 || day > 31) {
      throw Exception('Dia inválido.');
    }

    if (month < 1 || month > 12) {
      throw Exception('Mês inválido.');
    }

    return DateFormat('dd/MM/yyyy').parse(date);
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(2099, 1, 1),
    );

    if (pickedDate == null) return null;

    return DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
    );
  }
}
