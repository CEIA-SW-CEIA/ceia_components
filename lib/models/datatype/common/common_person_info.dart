import 'package:ceia_components/models/collection/common_person.dart';

class CommonPersonInfo {
  // TODO required
  String? uid;
  // TODO required
  String? name;
  // TODO required
  String? email;
  String? telNumber;

  CommonPersonInfo({this.uid, this.name, this.email, this.telNumber});

  factory CommonPersonInfo.fromCommonPerson(CommonPerson person) {
    return CommonPersonInfo(email: person.email, name: person.name, telNumber: person.telNumber, uid: person.id);
  }

  factory CommonPersonInfo.fromFirestore(Map<String, dynamic> data) {
    return CommonPersonInfo(
      uid: data['uid'],
      name: data['nome'],
      email: data['email'],
      telNumber: data['telefone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'nome': name,
      'email': email,
      'telefone': telNumber,
    };
  }
}
