import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommonPerson extends StampableCollection {
  String cpf;
  String name;
  String email;
  String telNumber;
  String birthDate;

  CommonPerson(
      {required super.id,
      required super.docRef,
      super.createdAt,
      super.updatedAt,
      super.author,
      required this.cpf,
      required this.name,
      required this.email,
      required this.telNumber,
      required this.birthDate});

  factory CommonPerson.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CommonPerson(
        id: snapshot.id,
        docRef: snapshot.reference,
        // TODO incompatível com o banco
        //createdAt: data['data_criacao'] as DateTime,
        //updatedAt: data['data_atualizacao'] as DateTime,
        //author: CommonPersonInfo.fromFirestore(data['cadastrante'] as Map<String, dynamic>),
        cpf: data['cpf'],
        name: data['nome'],
        email: data['email'],
        telNumber: data['telefone'],
        birthDate: data['data_nascimento']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      // TODO incompatível com o banco
      //'data_criacao': createdAt,
      //'data_atualizacao': updatedAt,
      //'cadastrante': author.toFirestore(),
      'cpf': cpf,
      'nome': name,
      'email': email,
      'telefone': telNumber,
      'data_nascimento': birthDate
    };
  }
}
