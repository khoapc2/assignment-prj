import 'dart:convert';
class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel(
    this.username, this.password,
  );

  Map<String, dynamic> toJson() => {
      'username': username.trim(),
      'password': password.trim(),
  };

  String LoginModelToJson() => json.encode(toJson());
}


class LoginResponseModel {
   int id;
   String token;
   String name;
   String role;

  LoginResponseModel({
    required this.id,
    required this.token,
    required this.name,
    required this.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return new LoginResponseModel(
      id: json["user_id"],
      token: json["token"],
      name: json["display_name"],
      role: json["role"]);
  }




}
