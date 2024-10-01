import 'package:ceia_components/models/collection/crm_trls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrmTrlsDto {
  int number;
  String description;
  DocumentReference crmTrls;

  CrmTrlsDto({required this.number, required this.description, required this.crmTrls});


  factory CrmTrlsDto.fromCrmTrls(CrmTrls crmTrls) {
    return CrmTrlsDto(number: crmTrls.number, description: crmTrls.description, crmTrls: crmTrls.docRef!);
  }

  factory CrmTrlsDto.fromFirestore(Map<String, dynamic> data) {
    return CrmTrlsDto(
      number: data['numero'] as int,
      description: data['descricao'] as String,
      crmTrls: data['crmTrls'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'numero': number,
      'descricao': description,
      'crmTrls': crmTrls,
    };
  }
}
