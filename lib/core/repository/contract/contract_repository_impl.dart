import 'package:ceia_components/core/model/firebase_entity/contract_document.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'contract_repository.dart';

class ContractRepositoryImpl implements ContractRepository {
  @override
  Future<CEIAResponse> get(DocumentReference contract) async {
    try {
      final snapshot = await contract.get();

      if (!snapshot.exists) {
        return CEIAResponse.error(message: 'Contrato não encontrado.');
      }

      return CEIAResponse.success(data: ContractDocument.fromFirestore(snapshot));
    } catch (e) {
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar o contrato.');
    }
  }

  @override
  Future<CEIAResponse> getAllFilterScholarshipHolder(
    DocumentReference project,
    DocumentReference scholarshipHolder,
  ) async {
    try {
      final snapshots = await project.collection('contrato').where('bolsista', isEqualTo: scholarshipHolder).get();

      if (snapshots.docs.isEmpty) {
        return CEIAResponse.success(data: [], message: 'Bolsista não possui contratos.');
      }

      final contracts = snapshots.docs.map((contract) => ContractDocument.fromFirestore(contract)).toList();

      return CEIAResponse.success(data: contracts);
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar os contratos do bolsista.');
    }
  }
}
