import 'package:cloud_firestore/cloud_firestore.dart';

class CommonStatus {
  String name;
  String statusType;
  DocumentReference status;

  CommonStatus({
    required this.name,
    required this.statusType,
    required this.status,
  });

  factory CommonStatus.fromFirestore(Map<String, dynamic> data) {
    return CommonStatus(
      name: data['nome'] as String,
      statusType: data['tipo_status'] as String,
      status: data['status'] as DocumentReference,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'tipo_status': statusType,
      'status': status,
    };
  }
}
