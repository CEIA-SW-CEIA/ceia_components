import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseEntity {
  final String id;
  final DocumentReference reference;

  FirebaseEntity({
    required this.id,
    required this.reference,
  });
}
