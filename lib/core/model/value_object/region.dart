class Region {
  final String id;
  final String name;
  final String abbreviation;

  Region({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'].toString(),
      name: json['nome'],
      abbreviation: json['sigla'],
    );
  }
}
