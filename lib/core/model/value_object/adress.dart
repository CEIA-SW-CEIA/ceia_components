import 'package:ceia_components/core/model/value_object/pair.dart';

class Adress {
  final String zipCode;
  final Pair<String, String> uf;
  final Pair<String, String> city;
  final String street;
  final String neighborhood;
  final String complement;
  final String number;

  const Adress({
    required this.zipCode,
    required this.uf,
    required this.street,
    required this.city,
    required this.neighborhood,
    required this.complement,
    required this.number,
  });

  factory Adress.fromMap(Map<String, dynamic> map) {
    return Adress(
      zipCode: map['cep'],
      uf: Pair.fromMap(map['uf'], firstKey: 'id', secondKey: 'sigla'),
      city: Pair.fromMap(map['cidade'], firstKey: 'id', secondKey: 'nome'),
      street: map['logradouro'],
      neighborhood: map['bairro'],
      complement: map['complemento'],
      number: map['numero'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': zipCode,
      'uf': uf.toMap(firstKey: 'id', secondKey: 'sigla'),
      'cidade': city.toMap(firstKey: 'id', secondKey: 'nome'),
      'logradouro': street,
      'bairro': neighborhood,
      'complemento': complement,
      'numero': number,
    };
  }
}
