import 'package:ceia_components/utils/list_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommonConfigApp {
  final List<String>? motivoAlteracaoStatus;
  final List<String> contratoBolsistaStatus;
  final List<String> centroCustoStatus;
  final List<String> projetoAdministrativoStatus;
  final List<String> projetoExecucaoStatus;
  final List<String> fonteRecurso;

  CommonConfigApp({
    this.motivoAlteracaoStatus,
    required this.contratoBolsistaStatus,
    required this.centroCustoStatus,
    required this.projetoAdministrativoStatus,
    required this.projetoExecucaoStatus,
    required this.fonteRecurso,
  });

  factory CommonConfigApp.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return CommonConfigApp(
      motivoAlteracaoStatus: ListUtils.dynamicToStringList(data['motivo_alteracao_status']),
      contratoBolsistaStatus: ListUtils.dynamicToStringList(data['contrato_bolsista_status']),
      centroCustoStatus: ListUtils.dynamicToStringList(data['centro_custo_status']),
      projetoAdministrativoStatus: ListUtils.dynamicToStringList(data['projeto_administrativo_status']),
      projetoExecucaoStatus: ListUtils.dynamicToStringList(data['projeto_execucao_status']),
      fonteRecurso: ListUtils.dynamicToStringList(data['fonte_recurso']),
    );
  }
}
