import 'package:ceia_components/core/model/firebase_entity/firebase_entity.dart';
import 'package:ceia_components/core/model/system_entity/scholarship_holder.dart';
import 'package:ceia_components/utils/date_time_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScholarshipHolderDocument extends FirebaseEntity {
  // Dados de identificação do bolsista
  final Map<String, dynamic> identification;

  // Dados de formação do bolsista
  final Map<String, dynamic> education;

  // Dados bancários do bolsista
  final Map<String, dynamic> bank;

  // Dados de endereço do bolsista
  final Map<String, dynamic> adress;

  // Dados do registrante
  final Map<String, dynamic> registrant;

  // Outros dados
  final String relevantInformation;
  final String ceiaObservation;

  // Datas de criação e atualização do documento
  final DateTime createdAt;
  final DateTime updatedAt;

  ScholarshipHolderDocument._({
    required super.id,
    required super.reference,
    required this.identification,
    required this.education,
    required this.bank,
    required this.adress,
    required this.registrant,
    required this.relevantInformation,
    required this.ceiaObservation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ScholarshipHolderDocument.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;

    return ScholarshipHolderDocument._(
      id: snapshot.id,
      reference: snapshot.reference,
      identification: data['identificacao'] as Map<String, dynamic>,
      education: data['ensino'] as Map<String, dynamic>,
      bank: data['banco'] as Map<String, dynamic>,
      adress: data['endereco'] as Map<String, dynamic>,
      registrant: data['cadastrante'] as Map<String, dynamic>,
      relevantInformation: data['informacoes_relevantes'],
      ceiaObservation: data['anotacoes_ceia'],
      createdAt: DateTimeUtils.timestampToDateTime(data['data_criacao']),
      updatedAt: DateTimeUtils.timestampToDateTime(data['data_atualizacao']),
    );
  }

  factory ScholarshipHolderDocument.fromScholarshipHolder(
    ScholarshipHolder scholarshipHolder,
  ) {
    return ScholarshipHolderDocument._(
      id: scholarshipHolder.id,
      reference: scholarshipHolder.reference,
      identification: scholarshipHolder.identification.toMap(),
      education: scholarshipHolder.educationLevel.toMap(),
      bank: scholarshipHolder.bank.toMap(),
      adress: scholarshipHolder.adress.toMap(),
      registrant: scholarshipHolder.registrant.toMap(),
      relevantInformation: scholarshipHolder.relevantInformation,
      ceiaObservation: scholarshipHolder.ceiaObservation,
      createdAt: scholarshipHolder.createdAt,
      updatedAt: scholarshipHolder.updatedAt,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'identificacao': identification,
      'ensino': education,
      'banco': bank,
      'endereco': adress,
      'cadastrante': registrant,
      'informacoes_relevantes': relevantInformation,
      'anotacoes_ceia': ceiaObservation,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
    };
  }
}
