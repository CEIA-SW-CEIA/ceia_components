import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: Gambiarra para reduzir consulta
// TODO: Na prática, não reduz consulta

class CommonPersonInfo {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DocumentReference userRef;

  const CommonPersonInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userRef,
  });

  factory CommonPersonInfo.fromMap(Map<String, dynamic> data) {
    return CommonPersonInfo(
      id: data['id'],
      name: data['nome'],
      email: data['email'],
      phone: data['telefone'],
      userRef: data['userRef'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'email': email,
      'telefone': phone,
      'userRef': userRef,
    };
  }
}
