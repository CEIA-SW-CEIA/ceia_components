import 'package:ceia_components/core/model/firebase_entity/institution_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:ceia_components/core/model/value_object/common/common_person_info.dart';
import 'package:ceia_components/core/model/value_object/contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Institution extends SystemEntity {
  final String cnpj;
  final String institutionName;
  final String fantasyName;
  final Contact mainContact;
  final List<Contact> otherContacts;
  final bool active;
  final DocumentReference institutionSize;
  final DocumentReference taxationType;
  final DocumentReference billing;
  final String observation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CommonPersonInfo user;

  Institution._({
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

  factory Institution.fromDocument(InstitutionDocument institutionDoc) {
    return Institution._(
      id: institutionDoc.id,
      reference: institutionDoc.reference,
      cnpj: institutionDoc.cnpj,
      institutionName: institutionDoc.institutionName,
      fantasyName: institutionDoc.fantasyName,
      mainContact: Contact.fromMap(institutionDoc.mainContact),
      otherContacts: institutionDoc.otherContacts.map((e) => Contact.fromMap(e)).toList(),
      active: institutionDoc.active,
      institutionSize: institutionDoc.institutionSize,
      taxationType: institutionDoc.taxationType,
      billing: institutionDoc.billing,
      observation: institutionDoc.observation,
      createdAt: institutionDoc.createdAt,
      updatedAt: institutionDoc.updatedAt,
      user: CommonPersonInfo.fromMap(institutionDoc.user),
    );
  }
}
