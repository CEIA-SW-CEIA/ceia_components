import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/core/model/system_entity/person.dart';
import 'package:ceia_components/utils/date_time_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonDocument extends FirebaseEntity {
  final String name;
  final String cpf;
  final String phone;
  final String email;
  final DateTime birthDayDate;
  final DateTime createdDate;

  PersonDocument._({
    required super.id,
    required super.reference,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.birthDayDate,
    required this.createdDate,
  });

  factory PersonDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    return PersonDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      name: map['nome'],
      cpf: map['cpf'],
      phone: map['telefone'],
      email: map['email'],
      birthDayDate: DateTimeUtils.timestampToDateTime(map['data_nascimento'] as Timestamp),
      createdDate: DateTimeUtils.timestampToDateTime(map['created_time'] as Timestamp),
    );
  }

  factory PersonDocument.fromPerson({
    required Person person,
  }) {
    return PersonDocument._(
      id: person.id,
      reference: person.reference,
      name: person.name,
      cpf: person.cpf,
      phone: person.phone,
      email: person.email,
      birthDayDate: person.birthDayDate,
      createdDate: person.createdDate,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'cpf': cpf,
      'telefone': phone,
      'email': email,
      'data_nascimento': birthDayDate,
      'created_time': createdDate,
    };
  }
}
