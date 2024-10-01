import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_contact.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommonCompanies extends StampableCollection {
  String cnpj;
  String companyName;
  String companyPopularName;
  CommonContact mainContact;
  bool active;
  List<CommonContact>? othersContacts;
  DocumentReference? companySize;
  DocumentReference? taxationType;
  DocumentReference? billing;
  String? notes;

  CommonCompanies({
    required super.id,
    required super.docRef,
    required this.cnpj,
    required this.companyName,
    required this.companyPopularName,
    required this.mainContact,
    required this.active,
    required super.createdAt,
    required super.updatedAt,
    required super.author,
    this.othersContacts,
    this.companySize,
    this.taxationType,
    this.billing,
    this.notes,
  });

  factory CommonCompanies.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CommonCompanies(
      id: snapshot.id,
      docRef: snapshot.reference,
      cnpj: data['cnpj'] as String,
      companyName: data['razao_social'] as String,
      companyPopularName: data['nome_fantasia'] as String,
      mainContact: CommonContact.fromFirestore(data['contato_principal'] as Map<String, dynamic>),
      active: data['ativo'] as bool,
      createdAt: data['data_criacao'] != null ? (data['data_criacao'] as Timestamp).toDate() : null,
      updatedAt: data['data_atualizacao'] != null ? (data['data_atualizacao'] as Timestamp).toDate() : null,
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
      othersContacts: data['outros_contatos'] != null
          ? (data['outros_contatos'] as List).map((contato) => CommonContact.fromFirestore(contato)).toList()
          : null,
      companySize: data['porte_empresa'] as DocumentReference?,
      taxationType: data['tipo_tributacao'] as DocumentReference?,
      billing: data['faturamento'] as DocumentReference?,
      notes: data['observacoes'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'cnpj': cnpj,
      'razao_social': companyName,
      'nome_fantasia': companyPopularName,
      'contato_principal': mainContact.toFirestore(),
      'ativo': active,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'cadastrante': author?.toFirestore(),
      'outros_contatos': othersContacts?.map((contato) => contato.toFirestore()).toList(),
      'porte_empresa': companySize,
      'tipo_tributacao': taxationType,
      'faturamento': billing,
      'observacoes': notes,
    };
  }
}
