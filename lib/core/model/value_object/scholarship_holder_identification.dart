import 'package:ceia_components/core/model/value_object/pair.dart';
import 'package:ceia_components/utils/date_time_utils.dart';

class ScholarshipHolderIdentification {
  final String motherName;
  final String maritalStatus;
  final bool foreigner;
  final String rg;
  final String rgConsignor;
  final Pair<String, String>? rgUfConsignor;
  final String passportNumber;
  final DateTime? passportExpirationDate;
  final String pisPasepNit;

  const ScholarshipHolderIdentification({
    required this.motherName,
    required this.maritalStatus,
    required this.foreigner,
    required this.rg,
    required this.rgConsignor,
    required this.rgUfConsignor,
    required this.passportNumber,
    required this.pisPasepNit,
    required this.passportExpirationDate,
  });

  factory ScholarshipHolderIdentification.fromMap(Map<String, dynamic> map) {
    final rg = map['rg'] as Map<String, dynamic>;
    final passport = map['passaporte'] as Map<String, dynamic>;

    final hasRg = rg['numero'] != null;
    final hasPassport = passport['numero'] != null;

    return ScholarshipHolderIdentification(
      motherName: map['nome_mae'],
      maritalStatus: map['estado_civil'],
      foreigner: map['estrangeiro'],
      rg: hasRg ? rg['numero'] : '',
      rgConsignor: hasRg ? rg['orgao_expedidor'] : '',
      rgUfConsignor: hasRg ? Pair.fromMap(rg['uf_expedidor'], firstKey: 'id', secondKey: 'sigla') : null,
      passportNumber: hasPassport ? passport['numero'] : '',
      passportExpirationDate: hasPassport ? DateTimeUtils.timestampToDateTime(passport['validade']) : null,
      pisPasepNit: map['pis_pasep_nit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome_mae': motherName,
      'estado_civil': maritalStatus,
      'estrangeiro': foreigner,
      'rg': _getRg(),
      'passaporte': _getPassport(),
      'pis_pasep_nit': pisPasepNit,
    };
  }

  Map<String, dynamic> _getRg() {
    if (rg.isEmpty) return {};

    return {
      'numero': rg,
      'orgao_expedidor': rgConsignor,
      'uf_expedidor': rgUfConsignor!.toMap(firstKey: 'id', secondKey: 'sigla'),
    };
  }

  Map<String, dynamic> _getPassport() {
    if (passportNumber.isEmpty) return {};

    return {
      'numero': passportNumber,
      'validade': passportExpirationDate,
    };
  }
}
