import 'package:ceia_components/models/collection/stampable_collection.dart';
import 'package:ceia_components/models/datatype/common/common_person_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScholarshipHolder extends StampableCollection {
  CommonPersonInfo user;
  String rg;
  String rgConsignor;
  String rgUfConsignor;
  String mothersName;
  String maritalStatus;
  String? pisPasepNit;
  bool foreigner;
  String? passportNumber;
  DateTime? passportExpirationDate;
  String? graduationLevel;
  String? graduationProgress;
  String? degree;
  String? graduationArea;
  bool? ifesLinked;
  String? ifesBondType;
  bool? ufgBond;
  int? ifesCounterpartWorkload;
  String? ifesRegistration;
  // TODO corrigir tipo
  int? programmingMaturity;
  // TODO corrigir tipo
  int? aiMaturity;
  String? lattesUrl;
  String bankName;
  int bankCode;
  String bankAgency;
  String bankAccountNumber;
  String zipCode;
  // TODO corrigir tipo
  String? uf;
  // TODO corrigir tipo
  String? city;
  String address;
  String neighborhood;
  String? complement;
  String? relevantInfos;
  String? ceiaNotes;

  ScholarshipHolder({
    required super.id,
    required super.docRef,
    required this.user,
    required this.rg,
    required this.rgConsignor,
    required this.rgUfConsignor,
    required this.mothersName,
    required this.maritalStatus,
    this.pisPasepNit,
    required this.foreigner,
    this.passportNumber,
    this.passportExpirationDate,
    this.graduationLevel,
    this.graduationProgress,
    this.degree,
    this.graduationArea,
    this.ifesLinked,
    this.ifesBondType,
    this.ufgBond,
    this.ifesCounterpartWorkload,
    this.ifesRegistration,
    //this.programmingMaturity,
    this.aiMaturity,
    this.lattesUrl,
    required this.bankName,
    required this.bankCode,
    required this.bankAgency,
    required this.bankAccountNumber,
    required this.zipCode,
    //required this.uf,
    //required this.city,
    required this.address,
    required this.neighborhood,
    this.complement,
    this.relevantInfos,
    this.ceiaNotes,
    required super.createdAt,
    required super.updatedAt,
    required super.author,
  });

  factory ScholarshipHolder.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() ?? <String, dynamic>{};
    return ScholarshipHolder(
      id: snapshot.id,
      docRef: snapshot.reference,
      user: CommonPersonInfo.fromFirestore(data['user'] as Map<String, dynamic>),
      rg: data['rg'] as String,
      rgConsignor: data['rg_expeditor'] as String,
      // TODO toString() necessário pois no banco está como int, contrariando a planilha
      rgUfConsignor: data['rg_uf_expeditor'].toString(),
      mothersName: data['nome_mae'] as String,
      maritalStatus: data['estado_civil'] as String,
      pisPasepNit: data['pis_pasep_nit'] as String?,
      foreigner: data['estrangeiro'] as bool,
      passportNumber: data['passaporte_numero'] as String?,
      passportExpirationDate: data['passaporte_validade'] as DateTime?,
      graduationLevel: data['nivel_formacao'] as String?,
      graduationProgress: data['formacao_andamento'] as String?,
      degree: data['curso'] as String?,
      graduationArea: data['area_formacao'] as String?,
      ifesLinked: data['ifes_vinculado'] as bool?,
      ifesBondType: data['ifes_tipo_vinculo'] as String?,
      ufgBond: data['vinculo_ufg'] as bool?,
      ifesCounterpartWorkload: data['ifes_carga_horaria_contrapartida'] as int?,
      ifesRegistration: data['ifes_matricula'] as String?,
      //programmingMaturity: data['maturidade_programacao'] as int?,
      //aiMaturity: data['maturidade_ia'] as int?,
      lattesUrl: data['url_lattes'] as String?,
      bankName: data['banco_nome'] as String,
      bankCode: data['banco_codigo'] as int,
      bankAgency: data['banco_agencia'] as String,
      bankAccountNumber: data['conta_corrente'] as String,
      zipCode: data['cep'] as String,
      //uf: data['uf'] as String,
      //city: data['cidade'] as String,
      address: data['endereco'] as String,
      neighborhood: data['bairro'] as String,
      complement: data['complemento'] as String?,
      relevantInfos: data['informacoes_relevantes'] as String?,
      ceiaNotes: data['anotacoes_ceia'] as String?,
      createdAt: (data['data_criacao'] as Timestamp).toDate(),
      updatedAt: (data['data_atualizacao'] as Timestamp).toDate(),
      author: CommonPersonInfo.fromFirestore(data['cadastrante'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'user': user.toFirestore(),
      'rg': rg,
      'rg_expeditor': rgConsignor,
      'rg_uf_expeditor': rgUfConsignor,
      'nome_mae': mothersName,
      'estado_civil': maritalStatus,
      'pis_pasep_nit': pisPasepNit,
      'estrangeiro': foreigner,
      'passaporte_numero': passportNumber,
      'passaporte_validade': passportExpirationDate,
      'nivel_formacao': graduationLevel,
      'formacao_andamento': graduationProgress,
      'curso': degree,
      'area_formacao': graduationArea,
      'ifes_vinculado': ifesLinked,
      'ifes_tipo_vinculo': ifesBondType,
      'vinculo_ufg': ufgBond,
      'ifes_carga_horaria_contrapartida': ifesCounterpartWorkload,
      'ifes_matricula': ifesRegistration,
      //'maturidade_programacao': programmingMaturity,
      //'maturidade_ia': aiMaturity,
      'url_lattes': lattesUrl,
      'banco_nome': bankName,
      'banco_codigo': bankCode,
      'banco_agencia': bankAgency,
      'conta_corrente': bankAccountNumber,
      'cep': zipCode,
      //'uf': uf,
      //'cidade': city,
      'endereco': address,
      'bairro': neighborhood,
      'complemento': complement,
      'informacoes_relevantes': relevantInfos,
      'anotacoes_ceia': ceiaNotes,
      'data_criacao': createdAt,
      'data_atualizacao': updatedAt,
      //'cadastrante': author.toFirestore(),
    };
  }
}
