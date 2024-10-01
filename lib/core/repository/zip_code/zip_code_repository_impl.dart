import 'dart:convert';

import 'package:ceia_components/core/model/value_object/adress.dart';
import 'package:ceia_components/core/model/value_object/pair.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:http/http.dart' as http;

part 'zip_code_repository.dart';

class ZipCodeRepositoryImpl implements ZipCodeRepository {
  @override
  Future<CEIAResponse> getAdressByZipCode(String zipCode) async {
    final code = zipCode.replaceAll('-', '');

    final String url = 'https://viacep.com.br/ws/$code/json/';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.body.contains('erro')) {
          return CEIAResponse.error(message: 'CEP não encontrado!');
        }

        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        final String ufId = jsonResponse['ibge'].toString().substring(0, 2);
        final String cityId = jsonResponse['ibge'].toString();

        final result = Adress(
          zipCode: jsonResponse['cep'],
          street: jsonResponse['logradouro'],
          neighborhood: jsonResponse['bairro'],
          city: Pair(cityId, jsonResponse['localidade']),
          uf: Pair(ufId, jsonResponse['uf']),
          complement: jsonResponse['complemento'],
          number: '',
        );

        return CEIAResponse.success(data: result);
      } else if (response.statusCode == 400) {
        return CEIAResponse.error(message: 'CEP inválido');
      }

      return CEIAResponse.error(message: 'Erro ao buscar endereço: ${response.statusCode}');
    } on Exception catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar endereço');
    }
  }
}
