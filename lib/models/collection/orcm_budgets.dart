import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrcmBudgets extends StampableCollection {
  double companyContribution;
  double embrapiiContribution;
  double ueContribution;
  double sebraeContribution;

  OrcmBudgets({
    required super.id,
    required super.docRef,
    required super.createdAt,
    required super.updatedAt,
    required super.author,
    required this.companyContribution,
    required this.embrapiiContribution,
    required this.ueContribution,
    required this.sebraeContribution,
  });

  factory OrcmBudgets.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return OrcmBudgets(
      id: snapshot.id,
      docRef: snapshot.reference,
      companyContribution: data['valor_aporte_empresa'],
      embrapiiContribution: data['valor_aporte_embrabii'],
      ueContribution: data['valor_aporte_ue'],
      sebraeContribution: data['valor_aporte_sebrae'],
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
    );
  }
}
