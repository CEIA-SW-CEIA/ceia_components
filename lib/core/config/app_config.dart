class AppConfig {
  final String apiUrl;
  final String authModuleUrl;
  final String scholarshipHolderModuleUrl;
  final String projectManagerModuleUrl;

  const AppConfig({
    required this.apiUrl,
    required this.authModuleUrl,
    required this.scholarshipHolderModuleUrl,
    required this.projectManagerModuleUrl,
  });

  // Factory para ler as variáveis de ambiente
  // String.fromEnvironment realiza a leitura dos valores injetados no ambiente
  factory AppConfig.fromEnv() {
    return const AppConfig(
      apiUrl: String.fromEnvironment(
        'API_URL',
        defaultValue: 'http://localhost:8080', // Valor padrão para segurança
      ),
      authModuleUrl: String.fromEnvironment('AUTH_URL'),
      scholarshipHolderModuleUrl: String.fromEnvironment('SCHOLARSHIP_HOLDER_URL'),
      projectManagerModuleUrl: String.fromEnvironment('PROJECT_MANAGER_URL'),
    );
  }
}
