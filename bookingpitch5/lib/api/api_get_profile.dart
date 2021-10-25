
import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileService {
  Future<ProfileModel> getProfileById() async {
    var client = http.Client();
    String url = "https://localhost:44322/api/v1/user-accounts/3";


    final response = await client.get(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
    );
    if(response.statusCode == 200 || response.statusCode == 400){
       return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
  }
}