import 'package:ceia_components/core/model/firebase_entity/person_document.dart';
import 'package:ceia_components/core/repository/person/person_repository.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonRepositoryImpl extends PersonRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<CEIAResponse> read(String id) async {
    try {
      final personSnapshot = await _firestore.collection('comum_pessoa').doc(id).get();

      if (!personSnapshot.exists) {
        return CEIAResponse.error(message: 'Não foi possivel encontrar os dados pessoais do usuário.');
      }

      final person = PersonDocument.fromFirestore(personSnapshot);

      return CEIAResponse.success(data: person);
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao obter os dados pessoais do usuário.');
    }
  }

  @override
  Future<CEIAResponse> fetchByCpf(String cpf) async {
    try {
      final personSnapshot = await _firestore.collection('comum_pessoa').where('cpf', isEqualTo: cpf).get();

      if (personSnapshot.docs.isEmpty) {
        return CEIAResponse.error(message: 'Nenhuma pessoa encontrada com o CPF informado.');
      }

      final person = PersonDocument.fromFirestore(personSnapshot.docs.first);

      return CEIAResponse.success(data: person);
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao buscar a pessoa pelo CPF.');
    }
  }

  @override
  Future<CEIAResponse> create({
    required String name,
    required String cpf,
    required String phone,
    required String email,
    required DateTime birthDayDate,
    required String id,
  }) async {
    try {
      final personMap = {
        'nome': name,
        'cpf': cpf,
        'telefone': phone,
        'email': email,
        'data_nascimento': birthDayDate,
        'created_time': DateTime.now(),
      };

      // TODO: retirar as informações redudantes ao migrar do flutterflow para o flutter
      final addPersonMap = {
        'display_name': name,
        'photo_url': '',
        'phone_number': phone,
        'uid': id,
      };

      final finalMap = {
        ...personMap,
        ...addPersonMap,
      };

      await _firestore.collection('comum_pessoa').doc(id).set(finalMap);

      return CEIAResponse.success(message: 'Dados pessoais do usuário criados com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao criar os dados pessoais do usuário.');
    }
  }

  @override
  Future<CEIAResponse> update({required PersonDocument personDocument}) async {
    try {
      await personDocument.reference.update(personDocument.toFirestore());

      return CEIAResponse.success(message: 'Dados pessoais do usuário atualizados com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao atualizar os dados pessoais do usuário.');
    }
  }

  @override
  Future<CEIAResponse> readAll() async {
    try {
      final personQuerySnapshot = await _firestore.collection('comum_pessoa').get();

      // Realiza a conversão removendo a ocorrência de nulos
      final personList = personQuerySnapshot.docs
          .map((doc) {
            if (doc.exists) {
              return PersonDocument.fromFirestore(doc);
            }
            return null;
          })
          .whereType<PersonDocument>()
          .toList();

      return CEIAResponse.success(data: personList);
    } catch (e) {
      LoggerUtils.showError(e);

      return CEIAResponse.error(message: 'Houve um erro ao obter os dados pessoais do usuário.');
    }
  }
}
