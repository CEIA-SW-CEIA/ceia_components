import 'package:cloud_firestore/cloud_firestore.dart';

class NameDocref {
  String name;
  DocumentReference documentReference;

  NameDocref({required this.name, required this.documentReference});

  factory NameDocref.fromFirestore(Map<String, dynamic> data) {
    return NameDocref(
      name: data['nome'] as String,
      documentReference: data['document_reference'] as DocumentReference,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'document_reference': documentReference,
    };
  }
}
