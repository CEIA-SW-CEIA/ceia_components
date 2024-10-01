import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_companies_info.dart';
import 'package:ceia_components/models/datatype/common/common_contact.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:ceia_components/models/datatype/crm_trls_dto.dart';
import 'package:ceia_components/models/datatype/orcm_programs_embrapii_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Project extends StampableCollection {
  String title;
  CommonCompaniesInfo mainCompany;
  CommonPersonInfo coordinator;
  String srinfoCode;
  DateTime contractStartDate;
  DateTime contractEndDate;

  DateTime? executionStartDate;
  DateTime? executionEndDate;
  List<CommonCompaniesInfo>? othersCompanies;
  String? folderUrl;
  String? contractUrl;
  CommonContact? companyContact;
  CrmTrlsDto? startTrl;
  CrmTrlsDto? endTrl;
  String? technicalSummary;
  String? comercialSummary;
  OrcmProgramasEmbrapiiDto? embrapiiProgram;
  List<DocumentReference>? majorAreas;
  CommonPersonInfo? subcoordinator;
  List<CommonPersonInfo>? participants;
  String? executionStatus;
  double? companyContribution;
  double? embrapiiContribution;
  double? ueContribution;
  double? sebraeContribution;
  double? totalContribution;
  double? intellectualProperty;
  DocumentReference? prospection;
  DocumentReference? proposalBudget;
  DocumentReference? proposal;
  bool? concluded;
  String? administrativeStatus;
  int? projectDuration;

  Project({
    super.id,
    super.docRef,
    super.createdAt,
    super.updatedAt,
    super.author,
    required this.title,
    required this.mainCompany,
    required this.coordinator,
    required this.srinfoCode,
    required this.contractStartDate,
    required this.contractEndDate,
    this.executionStartDate,
    this.executionEndDate,
    this.othersCompanies,
    this.folderUrl,
    this.contractUrl,
    this.companyContact,
    this.startTrl,
    this.endTrl,
    this.technicalSummary,
    this.comercialSummary,
    this.embrapiiProgram,
    this.majorAreas,
    this.subcoordinator,
    this.participants,
    this.executionStatus,
    this.companyContribution,
    this.embrapiiContribution,
    this.ueContribution,
    this.sebraeContribution,
    this.totalContribution,
    this.intellectualProperty,
    this.prospection,
    this.proposalBudget,
    this.proposal,
    this.concluded,
    this.administrativeStatus,
    this.projectDuration,
  });

  factory Project.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};

    return Project(
      id: snapshot.id,
      docRef: snapshot.reference,
      title: data['titulo'] as String,
      mainCompany: CommonCompaniesInfo.fromFirestore(data['empresa_principal'] as Map<String, dynamic>),
      othersCompanies: data['empresas_outras'] != null
          ? (data['empresas_outras'] as List<Map<String, dynamic>>)
              .map((e) => CommonCompaniesInfo.fromFirestore(e))
              .toList()
          : null,
      srinfoCode: data['codigo_srinfo'] as String,
      contractStartDate: (data['data_contrato_inicio'] as Timestamp).toDate(),
      contractEndDate: (data['data_contrato_fim'] as Timestamp).toDate(),
      folderUrl: data['url_pasta'] as String?,
      contractUrl: data['url_contrato'] as String?,
      companyContact: data['representante_empresa'] != null
          ? CommonContact.fromFirestore(data['representante_empresa'] as Map<String, dynamic>)
          : null,
      startTrl:
          data['trl_inicial'] != null ? CrmTrlsDto.fromFirestore(data['trl_inicial'] as Map<String, dynamic>) : null,
      endTrl: data['trl_final'] != null ? CrmTrlsDto.fromFirestore(data['trl_final'] as Map<String, dynamic>) : null,
      technicalSummary: data['resumo_tecnico'] as String?,
      comercialSummary: data['resumo_comercial'] as String?,
      embrapiiProgram: data['programa_embrapii'] != null
          ? OrcmProgramasEmbrapiiDto.fromFirestore(data['programa_embrapii'] as Map<String, dynamic>)
          : null,
      majorAreas:
          data['grandes_areas'] != null && (data['grandes_areas'] as List).isNotEmpty ? data['grandes_areas'] : null,
      coordinator: CommonPersonInfo.fromFirestore(data['coordenador'] as Map<String, dynamic>),
      subcoordinator: data['subcoordenador'] != null
          ? CommonPersonInfo.fromFirestore(data['subcoordenador'] as Map<String, dynamic>)
          : null,
      participants: (data['participantes'] as List).map((e) => CommonPersonInfo.fromFirestore(e)).toList(),
      executionStartDate:
          data['data_execucao_inicio'] != null ? DateTime.parse(data['data_execucao_inicio'] as String) : null,
      executionEndDate: data['data_execucao_fim'] != null ? DateTime.parse(data['data_execucao_fim'] as String) : null,
      executionStatus: data['status_execucao'],
      companyContribution: data['aporte_empresa'] as double?,
      embrapiiContribution: data['aporte_embrapii'] as double?,
      ueContribution: data['aporte_ue'] as double?,
      sebraeContribution: data['aporte_sebrae'] as double?,
      totalContribution: data['aporte_total'] as double?,
      intellectualProperty: data['propriedade_intelectual'] as double?,
      prospection: data['prospeccao'] as DocumentReference?,
      proposalBudget: data['orcamento_proposta'] as DocumentReference?,
      proposal: data['proposta'] as DocumentReference,
      concluded: data['concluido'] as bool,
      administrativeStatus: data['status_administrativo'],
      projectDuration: data['duracao_projeto'],
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'titulo': title,
      'empresa_principal': mainCompany.toFirestore(),
      'empresas_outras': othersCompanies?.map((e) => e.toFirestore()).toList(),
      'codigo_srinfo': srinfoCode,
      'data_contrato_inicio': contractStartDate,
      'data_contrato_fim': contractEndDate,
      'url_pasta': folderUrl,
      'url_contrato': contractUrl,
      'representante_empresa': companyContact?.toFirestore(),
      'trl_inicial': startTrl?.toFirestore(),
      'trl_final': endTrl?.toFirestore(),
      'resumo_tecnico': technicalSummary,
      'resumo_comercial': comercialSummary,
      'programa_embrapii': embrapiiProgram?.toFirestore(),
      'grandes_areas': majorAreas,
      'coordenador': coordinator.toFirestore(),
      'subcoordenador': subcoordinator?.toFirestore(),
      'participantes': participants?.map((e) => e.toFirestore()),
      'data_execucao_inicio': executionStartDate,
      'data_execucao_fim': executionEndDate,
      'status_execucao': executionStatus,
      'aporte_empresa': companyContribution,
      'aporte_embrapii': embrapiiContribution,
      'aporte_ue': ueContribution,
      'aporte_sebrae': sebraeContribution,
      'aporte_total': totalContribution,
      'propriedade_intelectual': intellectualProperty,
      'prospeccao': prospection,
      'orcamento_proposta': proposalBudget,
      'proposta': proposal,
      'concluido': concluded,
      'status_administrativo': administrativeStatus,
      'duracao_projeto': projectDuration,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'cadastrante': author?.toFirestore(),
    };
  }
}
