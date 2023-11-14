import 'dart:convert';

class RegisterModel {
  final String role;
  final String identityNumber;
  final String name;
  final String email;
  final String password;

  RegisterModel({
    required this.role,
    required this.identityNumber,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'identity_number': identityNumber,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      role: map['role'] ?? '',
      identityNumber: map['identity_number'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromJson(source);
}