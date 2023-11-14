import 'dart:convert';

class RegisterResponseModel {
    String? status;
    String? message;
    User? user;

    RegisterResponseModel({
        this.status,
        this.message,
        this.user,
    });

    String toJson() => json.encode(toJson());

    factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

    factory RegisterResponseModel.fromMap(Map<String, dynamic> json) {
      return RegisterResponseModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
    }

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
    };
}

class User {
    String? identityNumber;
    String? name;
    String? email;

    User({
        this.identityNumber,
        this.name,
        this.email,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        identityNumber: json["identity_number"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "identity_number": identityNumber,
        "name": name,
        "email": email,
    };
}
