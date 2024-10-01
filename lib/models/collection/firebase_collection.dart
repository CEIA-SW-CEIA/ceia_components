import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  String? id;
  DocumentReference? docRef;

  FirebaseCollection({this.id, this.docRef});
}
