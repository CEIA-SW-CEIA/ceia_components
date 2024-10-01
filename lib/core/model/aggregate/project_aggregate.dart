import 'package:ceia_components/core/model/system_entity/contract.dart';
import 'package:ceia_components/core/model/system_entity/project.dart';

class ProjectAggregate {
  final Project project;
  final List<Contract> contracts;

  ProjectAggregate({
    required this.project,
    required this.contracts,
  });

  factory ProjectAggregate.fromDependencies({
    required Project project,
    required List<Contract> contracts,
  }) {
    return ProjectAggregate(
      project: project,
      contracts: contracts,
    );
  }
}
