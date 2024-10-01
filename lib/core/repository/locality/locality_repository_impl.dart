import 'dart:convert';

import 'package:ceia_components/core/model/value_object/city.dart';
import 'package:ceia_components/core/model/value_object/uf.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:http/http.dart' as http;

part 'locality_repository.dart';

class LocalityRepositoryImpl implements LocalityRepository {
  @override
  Future<CEIAResponse> getCitiesByUf(String ufCode, {bool orderByName = false, bool keyAsCode = true}) async {
    if (ufCode.isEmpty) {
      return CEIAResponse.error(message: 'O estado informado é vazio');
    }

    String url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$ufCode/municipios';

    if (orderByName) {
      url += '?orderBy=nome';
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);

        Map<String, City> result = {};

        if (keyAsCode) {
          for (var city in jsonResponse) {
            result[city['id'].toString()] = City.fromJson(city);
          }
        } else {
          for (var city in jsonResponse) {
            result[city['nome']] = City.fromJson(city);
          }
        }

        return CEIAResponse.success(data: result);
      }

      return CEIAResponse.error(message: 'Erro ao buscar lista de cidades: ${response.statusCode}');
    } on Exception catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar lista de cidades');
    }
  }

  @override
  Future<CEIAResponse> getUfList({bool orderByName = false, bool keyAsCode = true}) async {
    String url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    if (orderByName) {
      url += '?orderBy=nome';
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);

        Map<String, Uf> result = {};

        if (keyAsCode) {
          for (var uf in jsonResponse) {
            result[uf['id'].toString()] = Uf.fromJson(uf);
          }
        } else {
          for (var uf in jsonResponse) {
            result[uf['sigla']] = Uf.fromJson(uf);
          }
        }

        return CEIAResponse.success(data: result);
      }

      return CEIAResponse.error(message: 'Erro ao buscar lista de estados: ${response.statusCode}');
    } on Exception catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar lista de estados');
    }
  }
}
