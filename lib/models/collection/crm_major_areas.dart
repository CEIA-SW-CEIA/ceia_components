import 'package:ceia_components/models/collection/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrmMajorAreas extends FirebaseCollection {
  String name;
  bool active;

  CrmMajorAreas({required super.id, required super.docRef, required this.name, required this.active});

  factory CrmMajorAreas.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CrmMajorAreas(
      id: snapshot.id,
      docRef: snapshot.reference,
      name: data['nome'],
      active: data['ativo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'ativo': active,
    };
  }
}
