import 'package:ceia_components/core/model/firebase_entity/scholarship_holder_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:ceia_components/core/model/value_object/adress.dart';
import 'package:ceia_components/core/model/value_object/bank.dart';
import 'package:ceia_components/core/model/value_object/common/common_person_info.dart';
import 'package:ceia_components/core/model/value_object/education_level.dart';
import 'package:ceia_components/core/model/value_object/scholarship_holder_identification.dart';

class ScholarshipHolder extends SystemEntity {
  final ScholarshipHolderIdentification identification;
  final EducationLevel educationLevel;
  final Bank bank;
  final Adress adress;
  final CommonPersonInfo registrant;

  // Outros dados
  final String relevantInformation;
  final String ceiaObservation;

  // Datas de criação e atualização do documento
  final DateTime createdAt;
  final DateTime updatedAt;

  ScholarshipHolder._({
    required super.id,
    required super.reference,
    required this.identification,
    required this.educationLevel,
    required this.bank,
    required this.adress,
    required this.registrant,
    required this.relevantInformation,
    required this.ceiaObservation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ScholarshipHolder.fromDocument(ScholarshipHolderDocument document) {
    return ScholarshipHolder._(
      id: document.id,
      reference: document.reference,
      identification: ScholarshipHolderIdentification.fromMap(document.identification),
      educationLevel: EducationLevel.fromMap(document.education),
      bank: Bank.fromMap(document.bank),
      adress: Adress.fromMap(document.adress),
      registrant: CommonPersonInfo.fromMap(document.registrant),
      relevantInformation: document.relevantInformation,
      ceiaObservation: document.ceiaObservation,
      createdAt: document.createdAt,
      updatedAt: document.updatedAt,
    );
  }

  factory ScholarshipHolder.update({
    required ScholarshipHolder scholarshipHolder,
    ScholarshipHolderIdentification? identification,
    EducationLevel? educationLevel,
    Bank? bank,
    Adress? adress,
    CommonPersonInfo? registrant,
    String? relevantInformation,
    String? ceiaObservation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ScholarshipHolder._(
      id: scholarshipHolder.id,
      reference: scholarshipHolder.reference,
      identification: identification ?? scholarshipHolder.identification,
      educationLevel: educationLevel ?? scholarshipHolder.educationLevel,
      bank: bank ?? scholarshipHolder.bank,
      adress: adress ?? scholarshipHolder.adress,
      registrant: registrant ?? scholarshipHolder.registrant,
      relevantInformation: relevantInformation ?? scholarshipHolder.relevantInformation,
      ceiaObservation: ceiaObservation ?? scholarshipHolder.ceiaObservation,
      createdAt: createdAt ?? scholarshipHolder.createdAt,
      updatedAt: updatedAt ?? scholarshipHolder.updatedAt,
    );
  }
}
