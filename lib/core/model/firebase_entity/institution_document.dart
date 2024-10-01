import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InstitutionDocument extends FirebaseEntity {
  final String cnpj;
  final String institutionName;
  final String fantasyName;
  final Map<String, dynamic> mainContact;
  final List<Map<String, dynamic>> otherContacts;
  final bool active;
  final DocumentReference institutionSize;
  final DocumentReference taxationType;
  final DocumentReference billing;
  final String observation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic> user;

  InstitutionDocument._({
    required super.id,
    required super.reference,
    required this.cnpj,
    required this.institutionName,
    required this.fantasyName,
    required this.mainContact,
    required this.otherContacts,
    required this.active,
    required this.institutionSize,
    required this.taxationType,
    required this.billing,
    required this.observation,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory InstitutionDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    return InstitutionDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      cnpj: map['cnpj'],
      institutionName: map['razao_social'],
      fantasyName: map['nome_fantasia'],
      mainContact: map['contato_principal'],
      otherContacts: map['outros_contatos'],
      active: map['ativo'],
      institutionSize: map['porte_empresa'],
      taxationType: map['tipo_tributacao'],
      billing: map['faturamento'],
      observation: map['observacoes'],
      createdAt: map['data_criacao'],
      updatedAt: map['data_atualizacao'],
      user: map['usuario'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'cnpj': cnpj,
      'razao_social': institutionName,
      'nome_fantasia': fantasyName,
      'contato_principal': mainContact,
      'outros_contatos': otherContacts,
      'ativo': active,
      'porte_empresa': institutionSize,
      'tipo_tributacao': taxationType,
      'faturamento': billing,
      'observacoes': observation,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'usuario': user,
    };
  }
}
