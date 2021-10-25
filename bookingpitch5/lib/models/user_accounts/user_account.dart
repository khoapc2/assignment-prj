class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}


class LoginResponseModel {
  final int id;
  final String token;
  final String name;
  final String role;

  LoginResponseModel({
    required this.id,
    required this.token,
    required this.name,
    required this.role,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json["user_id"] != null ? json["user_id"] : 0,
      token: json["token"] != null ? json["token"] : "",
      name: json["display_name"] != null ? json["display_name"] : "",
      role: json["role"] != null ? json["role"] : "",
    );
  }
}
