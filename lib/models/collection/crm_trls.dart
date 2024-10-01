import 'package:ceia_components/models/collection/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrmTrls extends FirebaseCollection {
  int number;
  String description;
  bool active;

  CrmTrls(
      {required super.id,
      required super.docRef,
      required this.number,
      required this.description,
      required this.active});

  factory CrmTrls.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CrmTrls(
      id: snapshot.id,
      docRef: snapshot.reference,
      number: data['numero'] as int,
      description: data['descricao'] as String,
      active: data['ativo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'numero': number,
      'descricao': description,
      'ativo': active,
    };
  }
}
