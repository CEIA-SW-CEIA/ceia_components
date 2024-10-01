import 'package:ceia_components/core/model/firebase_entity/scholarship_holder_document.dart';
import 'package:ceia_components/core/model/value_object/adress.dart';
import 'package:ceia_components/core/model/value_object/bank.dart';
import 'package:ceia_components/core/model/value_object/common/common_person_info.dart';
import 'package:ceia_components/core/model/value_object/education_level.dart';
import 'package:ceia_components/core/model/value_object/scholarship_holder_identification.dart';
import 'package:ceia_components/models/ceia_response.dart';
import 'package:ceia_components/utils/logger_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'scholarship_holder_repository.dart';

class ScholarshipHolderRepositoryImpl implements ScholarshipHolderRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<CEIAResponse> create(
    ScholarshipHolderIdentification identification,
    EducationLevel educationLevel,
    Bank bank,
    Adress adress,
    CommonPersonInfo registrant,
    String relevantInformation,
    String ceiaObservation,
    String id,
  ) async {
    try {
      await _firestore.collection('bolsista').doc(id).set({
        'identificacao': identification.toMap(),
        'ensino': educationLevel.toMap(),
        'banco': bank.toMap(),
        'endereco': adress.toMap(),
        'cadastrante': registrant.toMap(),
        'informacoes_relevantes': relevantInformation,
        'observacao_ceia': ceiaObservation,
        'data_criacao': DateTime.now(),
        'data_atualizacao': DateTime.now(),
      });

      return CEIAResponse.success(message: 'Documento do bolsista criado com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao criar o documento do bolsista.');
    }
  }

  @override
  Future<CEIAResponse> read(String id) async {
    try {
      final snapshot = await _firestore.collection('bolsista').doc(id).get();

      if (!snapshot.exists) {
        return CEIAResponse.error(message: 'Documento do bolsista não encontrado.');
      }

      return CEIAResponse.success(data: ScholarshipHolderDocument.fromFirestore(snapshot));
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao buscar o documento do bolsista.');
    }
  }

  @override
  Future<CEIAResponse> update(ScholarshipHolderDocument scholarshipHolderDocument) async {
    try {
      await scholarshipHolderDocument.reference.update(scholarshipHolderDocument.toFirestore());

      return CEIAResponse.success(message: 'Documento do bolsista atualizado com sucesso.');
    } catch (e) {
      LoggerUtils.showError(e);
      return CEIAResponse.error(message: 'Houve um erro interno ao atualizar o documento do bolsista.');
    }
  }
}
