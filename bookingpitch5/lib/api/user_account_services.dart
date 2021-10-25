import 'dart:convert';
import 'dart:io';

import 'package:bookingpitch5/models/sign_up_model.dart';
import 'package:http/http.dart' as http;

class UserAccountServices {
  var url = 'https://192.168.1.11:44322/api/v1/user-accounts';
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
      String r = await response.transform(utf8.decoder).join();
      print("aaaaaaaaaaaaaaaaaaaaaaaaa: " + r);
      print("aaaaaaaaaaaaaaaaaaaaaaaaa: 400 invalid host ");
      return false;
    }
  }
}
