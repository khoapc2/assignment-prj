
import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "https://localhost:44322/api/v1/user-accounts/login";

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, String>{
          'username' : loginRequestModel.username,
          'password' : loginRequestModel.password
          }),
    );
    if(response.statusCode == 200 || response.statusCode == 400){
       return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
  }
}