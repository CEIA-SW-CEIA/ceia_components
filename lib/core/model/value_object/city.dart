import 'package:ceia_components/core/model/value_object/uf.dart';

class City {
  final String id;
  final String name;
  final Uf state;

  City({
    required this.id,
    required this.name,
    required this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'].toString(),
      name: json['nome'],
      state: Uf.fromJson(json['microrregiao']['mesorregiao']['UF']),
    );
  }
}
