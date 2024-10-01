import 'package:ceia_components/core/model/value_object/region.dart';

class Uf {
  final String id;
  final String name;
  final String abbreviation;
  final Region region;

  Uf({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.region,
  });

  factory Uf.fromJson(Map<String, dynamic> json) {
    return Uf(
      id: json['id'].toString(),
      name: json['nome'],
      abbreviation: json['sigla'],
      region: Region.fromJson(json['regiao']),
    );
  }
}
