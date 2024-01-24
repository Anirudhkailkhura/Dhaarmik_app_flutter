import 'dart:convert';

// Convert a JSON string to a LoginModel object
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// Convert a LoginModel object to a JSON string
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.email,
        required this.password,
    });

    final String email;
    final String password;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
