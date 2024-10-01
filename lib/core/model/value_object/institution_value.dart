class InstitutionValue {
  final String id;
  final String cnpj;
  final String institutionName;
  final String fantasyName;
  final String institutionSize;
  final String taxationType;
  final String billing;

  InstitutionValue({
    required this.id,
    required this.cnpj,
    required this.institutionName,
    required this.fantasyName,
    required this.institutionSize,
    required this.taxationType,
    required this.billing,
  });

  factory InstitutionValue.fromMap(Map<String, dynamic> map) {
    return InstitutionValue(
      id: map['id'],
      cnpj: map['cnpj'],
      institutionName: map['razao_social'],
      fantasyName: map['nome_fantasia'],
      institutionSize: map['porte_empresa'],
      taxationType: map['tipo_tributacao'],
      billing: map['faturamento'],
    );
  }
}
