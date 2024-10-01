import 'package:cloud_firestore/cloud_firestore.dart';

class CommonCompaniesInfo {
  String companyName;
  String companyPopularName;
  String cnpj;
  DocumentReference company;

  CommonCompaniesInfo({
    required this.companyName,
    required this.companyPopularName,
    required this.cnpj,
    required this.company,
  });

  factory CommonCompaniesInfo.fromFirestore(Map<String, dynamic> data) {
    return CommonCompaniesInfo(
      companyName: data['razao_social'] as String,
      companyPopularName: data['nome_fantasia'] as String,
      cnpj: data['cnpj'] as String,
      company: data['instituicao'] as DocumentReference,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'razao_social': companyName,
      'nome_fantasia': companyPopularName,
      'cnpj': cnpj,
      'instituicao': company,
    };
  }
}
