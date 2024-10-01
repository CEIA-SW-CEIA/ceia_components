import 'package:ceia_components/core/model/firebase_entity/contract_document.dart';
import 'package:ceia_components/core/model/system_entity/system_entity.dart';
import 'package:ceia_components/core/model/value_object/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contract extends SystemEntity {
  final DocumentReference scholarshipHolder;
  final String function;
  final DateTime startDate;
  final DateTime endDate;
  final DocumentReference costCenter;
  final int installmentsAmount;
  final double installmentValue;
  final double monthlyWorkLoad;
  final DateTime statusChangeDate;
  final String reasonStatusChange;

  final String status;
  final DateTime createdDate;
  final DateTime updatedDate;
  final CommonPersonInfo registrant;

  Contract._({
    required super.id,
    required super.reference,
    required this.scholarshipHolder,
    required this.function,
    required this.startDate,
    required this.endDate,
    required this.costCenter,
    required this.installmentsAmount,
    required this.installmentValue,
    required this.monthlyWorkLoad,
    required this.statusChangeDate,
    required this.reasonStatusChange,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.registrant,
  });

  factory Contract.fromDocument(ContractDocument contractDoc) {
    return Contract._(
      id: contractDoc.id,
      reference: contractDoc.reference,
      scholarshipHolder: contractDoc.scholarshipHolder,
      function: contractDoc.function,
      startDate: contractDoc.startDate,
      endDate: contractDoc.endDate,
      costCenter: contractDoc.costCenter,
      installmentsAmount: contractDoc.installmentsAmount,
      installmentValue: contractDoc.installmentValue,
      monthlyWorkLoad: contractDoc.monthlyWorkLoad,
      statusChangeDate: contractDoc.statusChangeDate,
      reasonStatusChange: contractDoc.reasonStatusChange,
      status: contractDoc.status,
      createdDate: contractDoc.createdDate,
      updatedDate: contractDoc.updatedDate,
      registrant: CommonPersonInfo.fromMap(contractDoc.registrant),
    );
  }
}
