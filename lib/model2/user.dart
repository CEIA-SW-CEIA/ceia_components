import 'package:ceia_components/enums/system_modules.dart';

class CurrentUser {
  final bool scholarshipModule;
  final bool crmModule;
  final bool projectModule;
  final bool taskModule;
  final bool hasAdministrativeAcess;

  CurrentUser(
      {required this.scholarshipModule,
      required this.crmModule,
      required this.projectModule,
      required this.taskModule,
      required this.hasAdministrativeAcess});

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      scholarshipModule: json['modulo_bolsista'],
      crmModule: json['modulo_crm'],
      projectModule: json['modulo_projeto'],
      taskModule: json['modulo_tarefa'],
      hasAdministrativeAcess: json['administrativo'],
    );
  }
  // Método para obter a lista de módulos acessíveis
  List<SystemModules> getAccessibleModules() {
    final modules = <SystemModules>[];
    if (scholarshipModule) modules.add(SystemModules.scholarShipHolderModule);
    if (projectModule) modules.add(SystemModules.projectModule);
    return modules;
  }
}
