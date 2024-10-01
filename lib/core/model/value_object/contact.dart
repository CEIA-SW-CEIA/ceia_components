class Contact {
  final String name;
  final String phone;
  final String email;
  final String role;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
  });

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['nome'],
      phone: map['telefone'],
      email: map['email'],
      role: map['cargo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'telefone': phone,
      'email': email,
      'cargo': role,
    };
  }
}
