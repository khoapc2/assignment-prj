import 'dart:io';
import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'dart:convert';

class LoginService {
  HttpClient client = HttpClient();
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    LoginResponseModel responseModel;
    String link = "https://104.215.186.78/";
    String url = link + "api/v1/user-accounts/login";

    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request =
    await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(loginRequestModel.LoginModelToJson()));
    HttpClientResponse response = await request.close();
    if(response.statusCode == 200 || response.statusCode == 400){
      String reply = await response.transform(utf8.decoder).join();
       responseModel = LoginResponseModel.fromJson(jsonDecode(reply));
    } else {
      print(response.statusCode);
      throw Exception(Exception);
    }
    return responseModel;
  }
}