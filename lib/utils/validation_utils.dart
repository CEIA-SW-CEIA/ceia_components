import 'package:ceia_components/utils/date_time_utils.dart';

class ValidationUtils {
  static bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isCPFValid(String cpf) {
    String cpfClean = cpf.replaceAll(RegExp(r'[^\d]'), '');

    if (cpfClean.length != 11) {
      return false;
    }

    if (cpfClean == '00000000000') {
      return false;
    }

    int calculateDigit(String cpf, int lenght) {
      int sum = 0;

      for (int i = 0; i < lenght; i++) {
        sum += int.parse(cpf[i]) * (lenght + 1 - i);
      }

      int digit = (sum * 10) % 11;

      return digit > 9 ? 0 : digit;
    }

    var firstDigit = calculateDigit(cpfClean, 9);
    var secondDigit = calculateDigit(cpfClean, 10);

    return cpfClean.substring(9) == firstDigit.toString() + secondDigit.toString();
  }

  static bool isBirthdayDateValid(String date) {
    try {
      if (!isDateValid(date)) {
        return false;
      }

      DateTime parsedDate = DateTimeUtils.stringToDateTime(date);

      if (parsedDate.isAfter(DateTime.now())) {
        return false;
      }

      if (parsedDate.isBefore(DateTime(1900, 1, 1))) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  static bool isDateValid(String data) {
    try {
      DateTime parsedDate = DateTimeUtils.stringToDateTime(data);

      int month = parsedDate.month;
      int day = parsedDate.day;

      if (month < 1 || month > 12) {
        return false;
      }

      if (day < 1 || day > 31) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    String phoneNumberClean = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    var regex = RegExp(
      r'^\+?\d{1,3}?[-.\s]?\(?\d{2,3}\)?[-.\s]?\d{4,5}[-.\s]?\d{4}$',
      caseSensitive: false,
    );

    return regex.hasMatch(phoneNumberClean);
  }

  static bool isCEPValid(String cep) {
    String cepClean = cep.replaceAll(RegExp(r'[^\d]'), '');

    if (cepClean.length != 8) {
      return false;
    }

    return true;
  }
}
