import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/utils/date_time_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectDocument extends FirebaseEntity {
  // Aba de Identificação
  final String title;
  final Map<String, dynamic> mainInstitution;
  final List<Map<String, dynamic>> otherInstitution;
  final String srinfoCode;
  final List<String> resourceSource;
  final DateTime contractStartDate;
  final DateTime contractEndDate;
  final Map<String, dynamic> institutionRepresentative;
  final Map<String, dynamic> initialTrl;
  final Map<String, dynamic> finalTrl;
  final String technicalSummary;
  final String commercialSummary;
  final Map<String, dynamic> embrapiiProgram;
  final List<String> largeAreas;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic> registrant;

  // Aba de Execução
  final Map<String, dynamic> coordinator;
  final Map<String, dynamic> subCoordinator;
  final List<DocumentReference> participants;
  final DateTime executionStartDate;
  final DateTime executionEndDate;
  final int macroDeliveryQuantity;
  final Map<String, String> executionStatus;

  // Aba de Financeiro
  final double institutionContribution;
  final double embrapiiContribution;
  final double ueContribution;
  final double sebraeContribution;
  final double totalContribution;
  final double intellectualProperty;
  final DocumentReference prospecting;
  final DocumentReference budgetProposal;
  final DocumentReference projectProposal;
  final bool active;
  final String administrativeStatus;

  ProjectDocument._({
    required super.id,
    required super.reference,
    required this.title,
    required this.mainInstitution,
    required this.otherInstitution,
    required this.srinfoCode,
    required this.resourceSource,
    required this.contractStartDate,
    required this.contractEndDate,
    required this.institutionRepresentative,
    required this.initialTrl,
    required this.finalTrl,
    required this.technicalSummary,
    required this.commercialSummary,
    required this.embrapiiProgram,
    required this.largeAreas,
    required this.createdAt,
    required this.updatedAt,
    required this.registrant,
    required this.coordinator,
    required this.subCoordinator,
    required this.participants,
    required this.executionStartDate,
    required this.executionEndDate,
    required this.macroDeliveryQuantity,
    required this.executionStatus,
    required this.institutionContribution,
    required this.embrapiiContribution,
    required this.ueContribution,
    required this.sebraeContribution,
    required this.totalContribution,
    required this.intellectualProperty,
    required this.prospecting,
    required this.budgetProposal,
    required this.projectProposal,
    required this.active,
    required this.administrativeStatus,
  });

  factory ProjectDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    return ProjectDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      title: map['titulo'],
      mainInstitution: map['empresa_principal'],
      otherInstitution: _getOtherInstitution(map),
      srinfoCode: map['codigo_SRINFO'],
      resourceSource: map['fontes_recursos'].cast<String>(),
      contractStartDate: DateTimeUtils.timestampToDateTime(map['data_contrato_inicio']),
      contractEndDate: DateTimeUtils.timestampToDateTime(map['data_contrato_fim']),
      institutionRepresentative: map['representante_empresa'],
      initialTrl: map['trl_inicial'],
      finalTrl: map['trl_final'],
      technicalSummary: map['resumo_tecnico'],
      commercialSummary: map['resumo_comercial'],
      embrapiiProgram: map['programa_embrapii'],
      largeAreas: map['grandes_areas'].cast<String>(),
      createdAt: DateTimeUtils.timestampToDateTime(map['data_criacao']),
      updatedAt: DateTimeUtils.timestampToDateTime(map['data_atualizacao']),
      registrant: map['cadastrante'],
      coordinator: map['coordenador'],
      subCoordinator: map['subcoordenador'],
      participants: map['participantes'].cast<DocumentReference>(),
      executionStartDate: DateTimeUtils.timestampToDateTime(map['data_execucao_inicio']),
      executionEndDate: DateTimeUtils.timestampToDateTime(map['data_execucao_fim']),
      macroDeliveryQuantity: map['quantidade_macroentregas'],
      executionStatus: map['status_execucao'].cast<String, String>(),
      institutionContribution: _toDouble(map['aporte_empresa']),
      embrapiiContribution: _toDouble(map['aporte_embrapii']),
      ueContribution: _toDouble(map['aporte_ue']),
      sebraeContribution: _toDouble(map['aporte_sebrae']),
      totalContribution: _toDouble(map['aporte_total']),
      intellectualProperty: _toDouble(map['propriedade_intelectual']),
      prospecting: map['prospeccao'],
      budgetProposal: map['orcamento_proposta'],
      projectProposal: map['proposta'],
      active: map['ativo'],
      administrativeStatus: map['status_administrativo'],
    );
  }

  static List<Map<String, dynamic>> _getOtherInstitution(Map<String, dynamic> map) {
    final list = map['empresas_outras'] as List?;

    if (list == null || list.isEmpty) {
      return [];
    }

    return list.cast<Map<String, dynamic>>();
  }

  static double _toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    }

    return value;
  }
}
