class CommonContact {
  String name;
  String email;

  String? telNumber;
  String? position;

  CommonContact({required this.name, required this.email, this.telNumber, this.position});

  factory CommonContact.fromFirestore(Map<String, dynamic> data) {
    return CommonContact(
      name: data['nome'] as String,
      email: data['email'] as String,
      telNumber: data['telefone'] as String?,
      position: data['cargo'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': name,
      'email': email,
      'telefone': telNumber,
      'cargo': position,
    };
  }
}
