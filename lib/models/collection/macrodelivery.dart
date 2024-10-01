import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Macrodelivery extends StampableCollection {
  String title;
  int number;
  String goal;
  DateTime expectedStartDate;
  DateTime expectedEndDate;
  DateTime? actualStartDate;
  DateTime? actualEndDate;
  double? completionPercentage;
  bool? delayed;
  DateTime? acceptanceTermDate;

  Macrodelivery({
    super.id,
    super.docRef,
    super.createdAt,
    super.updatedAt,
    super.author,
    required this.title,
    required this.number,
    required this.goal,
    required this.expectedStartDate,
    required this.expectedEndDate,
    this.actualStartDate,
    this.actualEndDate,
    this.completionPercentage,
    this.delayed,
    this.acceptanceTermDate,
  });

  factory Macrodelivery.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return Macrodelivery(
      id: snapshot.id,
      docRef: snapshot.reference,
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: CommonPersonInfo.fromFirestore(data['cadastrante'] as Map<String, dynamic>),
      title: data['titulo'],
      number: data['numero'],
      goal: data['objetivo'],
      expectedStartDate: (data['data_previsao_inicio'] as Timestamp).toDate(),
      expectedEndDate: (data['data_previsao_fim'] as Timestamp).toDate(),
      actualStartDate: data['data_efetivo_inicio'] != null ? (data['data_efetivo_inicio'] as Timestamp).toDate() : null,
      actualEndDate: data['data_efetivo_fim'] != null ? (data['data_efetivo_fim'] as Timestamp).toDate() : null,
      completionPercentage: data['porcentagem_concusao'],
      delayed: data['houve_atraso'],
      acceptanceTermDate: data['data_termo_aceite'] != null ? (data['data_termo_aceite'] as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'titulo': title,
      'numero': number,
      'objetivo': goal,
      'data_previsao_inicio': expectedStartDate,
      'data_previsao_fim': expectedEndDate,
      'data_efetivo_inicio': actualStartDate,
      'data_efetivo_fim': actualEndDate,
      'porcentagem_concusao': completionPercentage,
      'houve_atraso': delayed,
      'data_termo_aceite': acceptanceTermDate,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'cadastrante': author?.toFirestore(),
    };
  }

  Macrodelivery copyWith({
    String? title,
    int? number,
    String? goal,
    DateTime? expectedStartDate,
    DateTime? expectedEndDate,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    double? completionPercentage,
    bool? delayed,
    DateTime? acceptanceTermDate,
    String? id,
    DocumentReference? docRef,
    DateTime? createdAt,
    DateTime? updatedAt,
    CommonPersonInfo? author,
  }) {
    return Macrodelivery(
      id: id ?? this.id,
      docRef: docRef ?? this.docRef,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      author: author ?? this.author,
      title: title ?? this.title,
      number: number ?? this.number,
      goal: goal ?? this.goal,
      expectedStartDate: expectedStartDate ?? this.expectedStartDate,
      expectedEndDate: expectedEndDate ?? this.expectedEndDate,
      actualStartDate: actualStartDate ?? this.actualStartDate,
      actualEndDate: actualEndDate ?? this.actualEndDate,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      delayed: delayed ?? this.delayed,
      acceptanceTermDate: acceptanceTermDate ?? this.acceptanceTermDate,
    );
  }
}
