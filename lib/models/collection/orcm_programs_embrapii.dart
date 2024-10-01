import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrcmProgramasEmbrapii extends StampableCollection {
  String name;
  DateTime startDate;
  DateTime endDate;
  double minimumProgramCounterpart;
  double maximumProgramCounterpart;
  double idealProgramCounterpart;
  double minimumUECounterpart;
  double maximumUECounterpart;
  double idealUECounterpart;
  double minimumCompanyCounterpart;
  double maximumCompanyCounterpart;
  double idealCompanyCounterpart;
  String summary;
  String observations;
  bool active;

  OrcmProgramasEmbrapii(
      {required super.id,
      required super.docRef,
      required super.createdAt,
      required super.updatedAt,
      required super.author,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.minimumProgramCounterpart,
      required this.maximumProgramCounterpart,
      required this.idealProgramCounterpart,
      required this.minimumUECounterpart,
      required this.maximumUECounterpart,
      required this.idealUECounterpart,
      required this.minimumCompanyCounterpart,
      required this.maximumCompanyCounterpart,
      required this.idealCompanyCounterpart,
      required this.summary,
      required this.observations,
      required this.active});

  factory OrcmProgramasEmbrapii.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return OrcmProgramasEmbrapii(
      id: snapshot.id,
      docRef: snapshot.reference,
      name: data['nome'],
      summary: data['resumo'],
      observations: data['observacoes'],
      active: data['ativo'],
      startDate: (data['vigencia_inicio'] as Timestamp).toDate(),
      endDate: (data['vigencia_fim'] as Timestamp).toDate(),
      minimumProgramCounterpart: data['contrapartida_programa_minima'],
      maximumProgramCounterpart: data['contrapartida_programa_maxima'],
      idealProgramCounterpart: data['contrapartida_programa_ideal'],
      minimumUECounterpart: data['contrapartida_ue_minima'],
      maximumUECounterpart: data['contrapartida_ue_maxima'],
      idealUECounterpart: data['contrapartida_ue_ideal'],
      minimumCompanyCounterpart: data['contrapartida_empresa_minima'],
      maximumCompanyCounterpart: data['contrapartida_empresa_maxima'],
      idealCompanyCounterpart: data['contrapartida_empresa_ideal'],
      createdAt: data['data_criacao'] != null ? (data['data_criacao'] as Timestamp).toDate() : null,
      updatedAt: data['data_atualizacao'] != null ? (data['data_atualizacao'] as Timestamp).toDate() : null,
      author: data['cadastrante'] != null ? CommonPersonInfo.fromFirestore(data['cadastrante']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'vigencia_inicio': startDate,
      'vigencia_fim': endDate,
      'contrapartida_programa_minima': minimumProgramCounterpart,
      'contrapartida_programa_maxima': maximumProgramCounterpart,
      'contrapartida_programa_ideal': idealProgramCounterpart,
      'contrapartida_ue_minima': minimumUECounterpart,
      'contrapartida_ue_maxima': maximumUECounterpart,
      'contrapartida_ue_ideal': idealUECounterpart,
      'contrapartida_empresa_minima': minimumCompanyCounterpart,
      'contrapartida_empresa_maxima': maximumCompanyCounterpart,
      'contrapartida_empresa_ideal': idealCompanyCounterpart,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'resumo': summary,
      'observacoes': observations,
      'ativo': active,
      'cadastrante': author?.toFirestore(),
    };
  }
}
