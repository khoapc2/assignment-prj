
import 'dart:io';

import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {

  
  Future<ProfileModel> getProfileById(int id) async {
    HttpClient client = HttpClient();
    String url = "https://104.215.186.78/api/v1/user-accounts/" + id.toString();

    ProfileModel profileModelResponse;
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();

    if(response.statusCode == 200){
      var data = jsonDecode(await response.transform(utf8.decoder).join());
      profileModelResponse = ProfileModel.fromJson(data);
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;
  }

  Future<ProfileModel> updateProfile(ProfileModel profileModel) async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    String url = "https://localhost:44322/api/v1/user-accounts";


    final response = await client.put(Uri.parse(url),
        headers: <String, String>
        {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'id' : id.toString(),
          'name' : profileModel.name,
          'email' : profileModel.email,
          'phone' : profileModel.phone,
          'address' : profileModel.address
          }),
    );
    if(response.statusCode == 200 || response.statusCode == 400){
       return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
  }
}