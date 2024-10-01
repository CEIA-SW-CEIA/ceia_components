import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contract extends StampableCollection {
  CommonPersonInfo scholarshipHolder;
  DateTime startDate;
  DateTime endDate;
  DocumentReference costCenter;
  int installmentsNumber;
  double scholarshipValue;
  double montlyWorkload;
  String role;
  String status;

  DateTime? dateStatusChange;
  String? reasonStatusChange;
  String? contractUrl;

  Contract({
    super.id,
    super.docRef,
    required this.scholarshipHolder,
    required this.startDate,
    required this.endDate,
    required this.costCenter,
    required this.installmentsNumber,
    required this.scholarshipValue,
    required this.montlyWorkload,
    required super.createdAt,
    required super.updatedAt,
    required super.author,
    required this.role,
    required this.status,
    this.dateStatusChange,
    this.reasonStatusChange,
    this.contractUrl,
  });

  factory Contract.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return Contract(
      id: snapshot.id,
      docRef: snapshot.reference,
      role: data['funcao'],
      scholarshipHolder: CommonPersonInfo.fromFirestore(data['bolsista'] as Map<String, dynamic>),
      startDate: (data['data_inicio'] as Timestamp).toDate(),
      endDate: (data['data_fim'] as Timestamp).toDate(),
      costCenter: data['centro_custo'] as DocumentReference,
      installmentsNumber: data['quantidade_parcelas'] as int,
      scholarshipValue: data['valor_bolsa'] as double,
      montlyWorkload: data['carga_horaria_mensal'] as double,
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: CommonPersonInfo.fromFirestore(data['cadastrante'] as Map<String, dynamic>),
      dateStatusChange:
          data['data_alteracao_status'] != null ? (data['data_alteracao_status'] as Timestamp).toDate() : null,
      reasonStatusChange: data['motivo_alteracao_status'] as String?,
      contractUrl: data['url_contrato'] as String?,
      status: data['status'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'bolsista': scholarshipHolder.toFirestore(),
      'funcao': role,
      'data_inicio': startDate,
      'data_fim': endDate,
      'centro_custo': costCenter,
      'quantidade_parcelas': installmentsNumber,
      'valor_bolsa': scholarshipValue,
      'carga_horaria_mensal': montlyWorkload,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      'cadastrante': author?.toFirestore(),
      'data_alteracao_status': dateStatusChange,
      'motivo_alteracao_status': reasonStatusChange,
      'url_contrato': contractUrl,
      'status': status,
    };
  }
}
