
import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<ProfileModel> getProfileById(int id) async {
    var client = http.Client();
    String url = "https://localhost:44322/api/v1/user-accounts/" + id.toString();


    final response = await client.get(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
    );
    if(response.statusCode == 200 || response.statusCode == 400){
       return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
  }

  Future<ProfileModel> updateProfile(ProfileModel profileModel) async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    String url = "https://localhost:44322/api/v1/user-accounts/";


    final response = await client.post(Uri.parse(url),
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