import 'package:flutter/material.dart';

class DropdownUtils {
  static List<DropdownMenuItem<String>> buildDropdownItems(List<String> items, {String? extraItem}) {
    if (extraItem != null) {
      return items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList()
        ..insert(0, DropdownMenuItem<String>(value: extraItem, child: Text(extraItem)));
    } else {
      return items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
    }
  }
}
