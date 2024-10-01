import 'package:ceia_components/core/model/firebase_entity/project_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:ceia_components/core/model/value_object/common/common_person_info.dart';
import 'package:ceia_components/core/model/value_object/contact.dart';
import 'package:ceia_components/core/model/value_object/institution_value.dart';
import 'package:ceia_components/core/model/value_object/pair.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Project extends SystemEntity {
  // Aba de Identificação
  final String title;
  final InstitutionValue mainInstitution;
  final List<InstitutionValue> otherInstitution;
  final String srinfoCode;
  final List<String> resourceSource;
  final DateTime contractStartDate;
  final DateTime contractEndDate;
  final Contact institutionRepresentative;
  final Map<String, dynamic> initialTrl;
  final Map<String, dynamic> finalTrl;
  final String technicalSummary;
  final String commercialSummary;
  final Map<String, dynamic> embrapiiProgram;
  final List<String> largeAreas;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CommonPersonInfo registrant;

  // Aba de Execução
  final CommonPersonInfo coordinator;
  final CommonPersonInfo subCoordinator;
  final List<DocumentReference> participants;
  final DateTime executionStartDate;
  final DateTime executionEndDate;
  final int macroDeliveryQuantity;
  final Pair<String, String> executionStatus;

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

  Project._({
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

  factory Project.fromDocument(ProjectDocument projectDoc) {
    return Project._(
      id: projectDoc.id,
      reference: projectDoc.reference,
      title: projectDoc.title,
      mainInstitution: InstitutionValue.fromMap(projectDoc.mainInstitution),
      otherInstitution: projectDoc.otherInstitution.map((e) => InstitutionValue.fromMap(e)).toList(),
      srinfoCode: projectDoc.srinfoCode,
      resourceSource: projectDoc.resourceSource,
      contractStartDate: projectDoc.contractStartDate,
      contractEndDate: projectDoc.contractEndDate,
      institutionRepresentative: Contact.fromMap(projectDoc.institutionRepresentative),
      initialTrl: projectDoc.initialTrl,
      finalTrl: projectDoc.finalTrl,
      technicalSummary: projectDoc.technicalSummary,
      commercialSummary: projectDoc.commercialSummary,
      embrapiiProgram: projectDoc.embrapiiProgram,
      largeAreas: projectDoc.largeAreas,
      createdAt: projectDoc.createdAt,
      updatedAt: projectDoc.updatedAt,
      registrant: CommonPersonInfo.fromMap(projectDoc.registrant),
      coordinator: CommonPersonInfo.fromMap(projectDoc.coordinator),
      subCoordinator: CommonPersonInfo.fromMap(projectDoc.subCoordinator),
      participants: projectDoc.participants,
      executionStartDate: projectDoc.executionStartDate,
      executionEndDate: projectDoc.executionEndDate,
      macroDeliveryQuantity: projectDoc.macroDeliveryQuantity,
      executionStatus: Pair.fromMap(projectDoc.executionStatus, firstKey: 'tipo', secondKey: 'descricao'),
      institutionContribution: projectDoc.institutionContribution,
      embrapiiContribution: projectDoc.embrapiiContribution,
      ueContribution: projectDoc.ueContribution,
      sebraeContribution: projectDoc.sebraeContribution,
      totalContribution: projectDoc.totalContribution,
      intellectualProperty: projectDoc.intellectualProperty,
      prospecting: projectDoc.prospecting,
      budgetProposal: projectDoc.budgetProposal,
      projectProposal: projectDoc.projectProposal,
      active: projectDoc.active,
      administrativeStatus: projectDoc.administrativeStatus,
    );
  }
}
