class CEIAMessage {
  // Definindo as strings como finais e privadas
  // Isso faz com que não seja possivel redefinir os valores em tempo de execução
  final String _string1 = "String 1";
  final String _string2 = "String 2";
  final String _string3 = "String 3";

  // Construtor privado
  CEIAMessage._privateConstructor();

  // Instância única da classe
  static final CEIAMessage _instance = CEIAMessage._privateConstructor();

  // Método de acesso à instância única
  static CEIAMessage get instance => _instance;

  // Métodos get para acessar as strings
  String get string1 => _string1;
  String get string2 => _string2;
  String get string3 => _string3;
}
