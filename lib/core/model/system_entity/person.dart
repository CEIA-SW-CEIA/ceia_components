import 'package:ceia_components/core/model/firebase_entity/person_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Person extends SystemEntity {
  final String name;
  final String cpf;
  final String phone;
  final String email;
  final DateTime birthDayDate;
  final DateTime createdDate;

  Person._({
    required super.id,
    required super.reference,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.birthDayDate,
    required this.createdDate,
  });

  factory Person.fromDocument(PersonDocument personDoc) {
    return Person._(
      id: personDoc.id,
      reference: personDoc.reference,
      name: personDoc.name,
      cpf: personDoc.cpf,
      phone: personDoc.phone,
      email: personDoc.email,
      birthDayDate: personDoc.birthDayDate,
      createdDate: personDoc.createdDate,
    );
  }

  factory Person.update({
    required Person person,
    String? name,
    String? cpf,
    String? phone,
    String? email,
    DateTime? birthDayDate,
  }) {
    return Person._(
      id: person.id,
      reference: person.reference,
      name: name ?? person.name,
      cpf: cpf ?? person.cpf,
      phone: phone ?? person.phone,
      email: email ?? person.email,
      birthDayDate: birthDayDate ?? person.birthDayDate,
      createdDate: person.createdDate,
    );
  }

  Map<String, dynamic> toCache() {
    return {
      'id': id,
      'reference': reference.path,
      'name': name,
      'cpf': cpf,
      'phone': phone,
      'email': email,
      'birthDayDate': birthDayDate.toIso8601String(),
      'createdDate': createdDate.toIso8601String(),
    };
  }

  factory Person.fromCache(Map<String, dynamic> cache) {
    return Person._(
      id: cache['id'],
      reference: FirebaseFirestore.instance.doc(cache['reference']),
      name: cache['name'],
      cpf: cache['cpf'],
      phone: cache['phone'],
      email: cache['email'],
      birthDayDate: DateTime.parse(cache['birthDayDate']),
      createdDate: DateTime.parse(cache['createdDate']),
    );
  }
}
