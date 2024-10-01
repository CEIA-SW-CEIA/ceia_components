import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SystemEntity {
  final String id;
  final DocumentReference reference;

  SystemEntity({
    required this.id,
    required this.reference,
  });
}
