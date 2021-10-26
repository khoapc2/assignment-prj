import 'dart:convert';
import 'dart:io';

import 'package:bookingpitch5/models/user_accounts/sign_up_model.dart';
import 'package:http/http.dart' as http;

class UserAccountServices {
  // var url = 'https://10.0.2.2:44322/api/v1/user-accounts'; // local
  var url = 'https://104.215.186.78/api/v1/user-accounts';  // server
  HttpClient client = HttpClient();

  Future<bool> SignUp(SignUpModel model) async {
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request =
        await client.postUrl(Uri.parse(url + "/register"));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(model.SignUpModelToJson()));
    HttpClientResponse response = await request.close();

    // final response = await http.post(Uri.parse(url + "/register"),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8'
    //     },
    //     body: model.SignUpModelToJson());

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
