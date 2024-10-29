import 'package:ceia_components/core/model/firebase_entity/contract_document.dart';
import 'package:ceia_components/core/model/system_entity/contract.dart';
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

  @override
  Future<CEIAResponse> getAllContractsForUser(
    DocumentReference scholarshipHolder,
  ) async {
    try {
      // Usando collectionGroup para buscar contratos em todas as subcoleções 'contrato'
      final querySnapshot = await FirebaseFirestore.instance
          .collectionGroup('contrato')
          .where('bolsista', isEqualTo: scholarshipHolder)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return CEIAResponse.success(data: [], message: 'Bolsista não possui contratos.');
      }

      // Mapeia os documentos para uma lista com o contrato e o nome do projeto associado
      final contractsWithProjectNames = await Future.wait(querySnapshot.docs.map((doc) async {
        final contractDoc = ContractDocument.fromFirestore(doc);
        final contract = Contract.fromDocument(contractDoc);

        // Obter a referência do projeto a partir do caminho do documento
        final projectDocRef = doc.reference.parent.parent;

        String projectTitle = 'Título indisponível';

        if (projectDocRef != null) {
          final projectSnapshot = await projectDocRef.get();
          if (projectSnapshot.exists && projectSnapshot.data() != null) {
            final projectData = projectSnapshot.data() as Map<String, dynamic>;
            projectTitle = projectData['titulo'] ?? 'Título indisponível';
          }
        }

        // Retorna um mapa com o contrato e o nome do projeto
        return {
          'contract': contract,
          'projectTitle': projectTitle,
        };
      }).toList());

      return CEIAResponse.success(data: contractsWithProjectNames);
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar os contratos do bolsista.');
    }
  }
}
