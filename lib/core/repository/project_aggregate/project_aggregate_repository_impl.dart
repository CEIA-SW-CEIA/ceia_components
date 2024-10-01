import 'package:ceia_components/core/model/aggregate/project_aggregate.dart';
import 'package:ceia_components/core/model/firebase_entity/contract_document.dart';
import 'package:ceia_components/core/model/firebase_entity/project_document.dart';
import 'package:ceia_components/core/model/system_entity/contract.dart';
import 'package:ceia_components/core/model/system_entity/project.dart';
import 'package:ceia_components/core/repository/contract/contract_repository_impl.dart';
import 'package:ceia_components/core/repository/project/project_repository_impl.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/document_reference_utils.dart';
import 'package:ceia_components/utils/logger_utils.dart';

part 'project_aggregate_repository.dart';

class ProjectAggregateRepositoryImpl implements ProjectAggregateRepository {
  final ProjectRepositoryImpl _projectRepository;
  final ContractRepositoryImpl _contractRepository;

  ProjectAggregateRepositoryImpl({
    required ProjectRepositoryImpl projectRepository,
    required ContractRepositoryImpl contractRepository,
  })  : _projectRepository = projectRepository,
        _contractRepository = contractRepository;

  @override
  Future<CEIAResponse> getAllFromScholarshipHolder(String scholarshipHolderId) async {
    try {
      final scholarShipHolderReference = DocumentReferenceUtils.getDocRefFromPath('bolsista/$scholarshipHolderId');

      final projectsResponse = await _projectRepository.getAllFilterScholarshipHolder(scholarShipHolderReference);

      if (projectsResponse.isError) {
        return projectsResponse;
      }

      final projectsList = projectsResponse.data as List;

      if (projectsList.isEmpty) {
        return CEIAResponse.success(data: [], message: 'Bolsista não possui projetos.');
      }

      final projects = projectsList as List<ProjectDocument>;

      final projectAggregateFutures = projects.map((projectDocument) async {
        final project = Project.fromDocument(projectDocument);

        final contractsResponse = await _contractRepository.getAllFilterScholarshipHolder(
            projectDocument.reference, scholarShipHolderReference);

        if (contractsResponse.isError) {
          return CEIAResponse.error(message: 'Houve um erro interno ao buscar os contratos do bolsista.');
        }

        final contractDocuments = contractsResponse.data as List<ContractDocument>;
        final contracts = contractDocuments.map((contract) => Contract.fromDocument(contract)).toList();

        final projectAggregate = ProjectAggregate.fromDependencies(
          project: project,
          contracts: contracts,
        );

        return projectAggregate;
      }).toList();

      final result = await Future.wait(projectAggregateFutures);

      final List<ProjectAggregate> projectAggregates = result.cast<ProjectAggregate>();

      return CEIAResponse.success(data: projectAggregates);
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar os projetos e contratos do bolsista.');
    }
  }
}
