import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_accounts/sign_up_model.dart';


class UserAccountServices {
  // var url = 'https://104.215.186.78/api/v1/user-accounts'; // local
  var url = 'https://104.215.186.78/api/v1/user-accounts';  // server
  HttpClient client = HttpClient();

  Future<bool> SignUp(SignUpModel model) async {
    final response = await http.post(Uri.parse(url + "/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: model.SignUpModelToJson());

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
