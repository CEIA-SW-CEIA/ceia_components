import 'package:ceia_components/core/model/value_object/city.dart';
import 'package:ceia_components/core/model/value_object/uf.dart';
import 'package:flutter/material.dart';

class LocalityUtils {
  static List<DropdownMenuItem<String>> citiesToDropdown(Map<String, City> cities, {bool sortByCityName = true}) {
    if (cities.isEmpty) {
      return [];
    }

    if (sortByCityName) {
      cities = Map.fromEntries(cities.entries.toList()..sort((a, b) => a.value.name.compareTo(b.value.name)));
    }

    return cities.entries
        .map((e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value.name),
            ))
        .toList();
  }

  static List<DropdownMenuItem<String>> statesToDropdown(Map<String, Uf> states, {bool sortByStateName = true}) {
    if (states.isEmpty) {
      return [];
    }

    if (sortByStateName) {
      states = Map.fromEntries(states.entries.toList()..sort((a, b) => a.value.name.compareTo(b.value.name)));
    }

    return states.entries
        .map((e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value.abbreviation),
            ))
        .toList();
  }
}
