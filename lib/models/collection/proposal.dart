import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_companies_info.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Proposal extends StampableCollection {
  String title;
  CommonCompaniesInfo mainCompany;
  CommonPersonInfo coordinator;
  DocumentReference? prospection;
  DocumentReference? startTrl;
  DocumentReference? endTrl;
  String? technicalSummary;
  DocumentReference? embrapiiProgram;
  String? intellectualProperty;
  DocumentReference? budget;
  List<DocumentReference>? majorAreas;
  int? projectDuration;

  Proposal(
      {required super.id,
      required super.docRef,
      required super.createdAt,
      required super.updatedAt,
      required super.author,
      required this.title,
      required this.mainCompany,
      required this.coordinator,
      required this.prospection,
      this.startTrl,
      this.endTrl,
      this.technicalSummary,
      this.embrapiiProgram,
      this.intellectualProperty,
      this.majorAreas,
      this.projectDuration,
      this.budget});

  factory Proposal.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return Proposal(
      id: snapshot.id,
      docRef: snapshot.reference,
      title: data['titulo'] as String,
      coordinator: CommonPersonInfo.fromFirestore(data['coordenador'] as Map<String, dynamic>),
      mainCompany: CommonCompaniesInfo.fromFirestore(data['empresa_principal'] as Map<String, dynamic>),
      prospection: data['prospeccao'],
      startTrl: data['trl_inicial'],
      endTrl: data['trl_final'],
      technicalSummary: data['resumo_tecnico'] as String?,
      embrapiiProgram: data['programa_embrapii'],
      budget: data['orcamento'] ?? data['orcamento_prospeccao'],
      intellectualProperty: data['propriedade_intelectual'],
      projectDuration: data['duracao_projeto'],
      majorAreas:
          data['grandes_areas'] != null && (data['grandes_areas'] as List).isNotEmpty ? data['grandes_areas'] : null,
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
    );
  }
}
