import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:ceia_components/models/datatype/project_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CostCenter extends StampableCollection {
  String code;
  String name;
  String resourceSource;
  ProjectInfo project;
  double balance;
  String bankName;
  int bankCode;
  String bankBranch;
  String accountNumber;
  String status;

  CostCenter({
    super.id,
    super.docRef,
    required super.createdAt,
    required super.updatedAt,
    super.author,
    required this.code,
    required this.project,
    required this.balance,
    required this.bankName,
    required this.bankCode,
    required this.bankBranch,
    required this.accountNumber,
    required this.name,
    required this.resourceSource,
    required this.status,
  });

  // Adicionando o método copyWith
  CostCenter copyWith({
    String? code,
    String? name,
    String? resourceSource,
    ProjectInfo? project,
    double? balance,
    String? bankName,
    int? bankCode,
    String? bankBranch,
    String? accountNumber,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    CommonPersonInfo? author,
    String? id,
    DocumentReference? docRef,
  }) {
    return CostCenter(
      code: code ?? this.code,
      name: name ?? this.name,
      resourceSource: resourceSource ?? this.resourceSource,
      project: project ?? this.project,
      balance: balance ?? this.balance,
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
      bankBranch: bankBranch ?? this.bankBranch,
      accountNumber: accountNumber ?? this.accountNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      author: author ?? this.author,
      id: id ?? this.id,
      docRef: docRef ?? this.docRef,
    );
  }

  factory CostCenter.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CostCenter(
      id: snapshot.id,
      docRef: snapshot.reference,
      code: data['codigo'],
      project: ProjectInfo.fromFirestore(data['projeto']),
      balance: data['saldo'],
      bankName: data['banco_nome'],
      bankCode: data['banco_codigo'],
      bankBranch: data['banco_agencia'],
      accountNumber: data['conta'],
      name: data['nome'],
      resourceSource: data['fonte_recurso'],
      status: data['status'],
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'codigo': code,
      'nome': name,
      'fonte_recurso': resourceSource,
      'projeto': project.toFirestore(),
      'saldo': balance,
      'banco_nome': bankName,
      'banco_codigo': bankCode,
      'banco_agencia': bankBranch,
      'conta': accountNumber,
      'status': status,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'cadastrante': author?.toFirestore(),
    };
  }
}
