class EducationLevel {
  final String graduationLevel;
  final String graduationProgress;
  final String degree;
  final String graduationArea;
  final bool ifesLinked;
  final String ifesLinkType;
  final bool ufgLinked;
  final int ifesCounterpartWorkload;
  final String ifesRegistration;
  final String programmingMaturity;
  final String aiMaturity;
  final String lattesUrl;

  const EducationLevel({
    required this.graduationLevel,
    required this.graduationProgress,
    required this.degree,
    required this.graduationArea,
    required this.ifesLinked,
    required this.ifesLinkType,
    required this.ufgLinked,
    required this.ifesCounterpartWorkload,
    required this.ifesRegistration,
    required this.programmingMaturity,
    required this.aiMaturity,
    required this.lattesUrl,
  });

  factory EducationLevel.fromMap(Map<String, dynamic> map) {
    final education = map['formacao'] as Map<String, dynamic>;
    final ifes = map['ifes'] as Map<String, dynamic>;

    return EducationLevel(
      graduationLevel: education['nivel_formacao'],
      graduationProgress: education['formacao_andamento'],
      degree: education['area_formacao_andamento'],
      graduationArea: education['area_formacao'],
      ifesLinked: ifes.isNotEmpty,
      ifesLinkType: ifes['tipo_vinculo'] ?? '',
      ufgLinked: ifes['vinculo_ufg'] ?? false,
      ifesCounterpartWorkload: ifes['carga_horaria_contrapartida'] ?? 0,
      ifesRegistration: ifes['matricula'] ?? '',
      programmingMaturity: map['maturidade_programacao'],
      aiMaturity: map['maturidade_ia'],
      lattesUrl: map['url_lattes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'formacao': {
        'nivel_formacao': graduationLevel,
        'formacao_andamento': graduationProgress,
        'area_formacao_andamento': degree,
        'area_formacao': graduationArea,
      },
      'ifes': _getIfes(),
      'maturidade_programacao': programmingMaturity,
      'maturidade_ia': aiMaturity,
      'url_lattes': lattesUrl,
    };
  }

  Map<String, dynamic> _getIfes() {
    if (!ifesLinked) return {};

    return {
      'tipo_vinculo': ifesLinkType,
      'vinculo_ufg': ufgLinked,
      'carga_horaria_contrapartida': ifesCounterpartWorkload,
      'matricula': ifesRegistration,
    };
  }
}
