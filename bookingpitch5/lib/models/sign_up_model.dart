
import 'dart:convert';

class SignUpModel {
  String fullname;
  String email;
  String phone;
  String address;
  String username;
  String password;

  SignUpModel(this.fullname, this.email, this.phone, this.address,
      this.username, this.password);

  Map<String, dynamic> toJson() => {
    'username' : username,
    'password' : password,
    'name' : fullname,
    'email' : email,
    'address' : address,
    'role' : 'customer',
  };

  String SignUpModelToJson() => json.encode(toJson());
}
