class Bank {
  final String name;
  final String code;
  final String agency;
  final String account;

  const Bank({
    required this.name,
    required this.code,
    required this.agency,
    required this.account,
  });

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      name: map['nome'],
      code: map['codigo'],
      agency: map['agencia'],
      account: map['conta_corrente'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'codigo': code,
      'agencia': agency,
      'conta_corrente': account,
    };
  }
}
