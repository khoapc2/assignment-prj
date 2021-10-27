import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String link = "https://localhost:44322/";//192.168.1.5
    String url = link + "api/v1/user-accounts/login";

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',

        },
        body: jsonEncode(<String, String>{
          'username' : loginRequestModel.username,
          'password' : loginRequestModel.password
          }),
    );
    if(response.statusCode == 200 || response.statusCode == 400){
      print(response.statusCode);

      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(Exception);
    }
  }
}