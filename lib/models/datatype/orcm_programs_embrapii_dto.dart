import 'package:ceia_components/models/collection/orcm_programs_embrapii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrcmProgramasEmbrapiiDto {
  String name;
  DateTime startDate;
  DateTime endDate;
  // TODO deve ser obrigatório
  DateTime? updatedAt;
  double minimumProgramCounterpart;
  double maximumProgramCounterpart;
  double idealProgramCounterpart;
  double minimumUECounterpart;
  double maximumUECounterpart;
  double idealUECounterpart;
  double minimumCompanyCounterpart;
  double maximumCompanyCounterpart;
  double idealCompanyCounterpart;

  OrcmProgramasEmbrapiiDto(
      {this.updatedAt,
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
      required this.idealCompanyCounterpart});

  factory OrcmProgramasEmbrapiiDto.fromEmbrapii(OrcmProgramasEmbrapii embrapii) {
    return OrcmProgramasEmbrapiiDto(
      updatedAt: embrapii.updatedAt,
      startDate: embrapii.startDate,
      endDate: embrapii.endDate,
      name: embrapii.name,
      minimumProgramCounterpart: embrapii.minimumProgramCounterpart,
      maximumProgramCounterpart: embrapii.maximumProgramCounterpart,
      idealProgramCounterpart: embrapii.idealProgramCounterpart,
      minimumUECounterpart: embrapii.minimumUECounterpart,
      maximumUECounterpart: embrapii.maximumUECounterpart,
      idealUECounterpart: embrapii.idealUECounterpart,
      minimumCompanyCounterpart: embrapii.minimumCompanyCounterpart,
      maximumCompanyCounterpart: embrapii.maximumCompanyCounterpart,
      idealCompanyCounterpart: embrapii.idealCompanyCounterpart,
    );
  }

  factory OrcmProgramasEmbrapiiDto.fromFirestore(Map<String, dynamic> data) {
    return OrcmProgramasEmbrapiiDto(
      name: data['nome'],
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
      updatedAt: data['data_atualizacao'] != null ? (data['data_atualizacao'] as Timestamp).toDate() : null,
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
      'data_atualizacao': updatedAt,
    };
  }
}
