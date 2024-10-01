import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/utils/date_time_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContractDocument extends FirebaseEntity {
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
  final Map<String, dynamic> registrant;

  ContractDocument._({
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

  factory ContractDocument.fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;

    return ContractDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      scholarshipHolder: map['bolsista'],
      function: map['funcao'],
      startDate: DateTimeUtils.timestampToDateTime(map['data_inicio'] as Timestamp),
      endDate: DateTimeUtils.timestampToDateTime(map['data_fim'] as Timestamp),
      costCenter: map['centro_custo'],
      installmentsAmount: map['quantidade_parcelas'],
      installmentValue: _toDouble(map['valor_bolsa']),
      monthlyWorkLoad: _toDouble(map['carga_horaria_mensal']),
      statusChangeDate: DateTimeUtils.timestampToDateTime(map['data_alteracao_status'] as Timestamp),
      reasonStatusChange: map['motivo_alteracao_status'],
      status: map['status'],
      createdDate: DateTimeUtils.timestampToDateTime(map['data_criacao'] as Timestamp),
      updatedDate: DateTimeUtils.timestampToDateTime(map['data_atualizacao'] as Timestamp),
      registrant: map['cadastrante'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'bolsista': scholarshipHolder,
      'funcao': function,
      'data_inicio': startDate,
      'data_fim': endDate,
      'centro_custo': costCenter,
      'quantidade_parcelas': installmentsAmount,
      'valor_bolsa': installmentValue,
      'carga_horaria_mensal': monthlyWorkLoad,
      'data_alteracao_status': statusChangeDate,
      'motivo_alteracao_status': reasonStatusChange,
      'status': status,
      'data_criacao': createdDate,
      'data_atualizacao': updatedDate,
      'cadastrante': registrant,
    };
  }

  static double _toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    }

    return value;
  }
}
