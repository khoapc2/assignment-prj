
import 'dart:io';

import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {

  Future<ProfileModel> getProfileById(int id) async {
    String url = "https://104.215.186.78/api/v1/user-accounts/" + id.toString();

    ProfileModel profileModelResponse;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      profileModelResponse = ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;
  }

  Future<ProfileModel> updateProfile(ProfileModel profileModel) async {
    String url = "https://104.215.186.78/api/v1/user-accounts/";
    ProfileModel profileModelResponse;
    
    final response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(profileModel.toJson()));

    if(response.statusCode == 200){
      profileModelResponse = ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;   
  }
}