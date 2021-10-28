
import 'dart:io';

import 'dart:convert';

import '../models/user_accounts/profile_model.dart';


class ProfileService {

  HttpClient client = HttpClient();
  Future<ProfileModel> getProfileById(int id) async {
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
    String url = "https://104.215.186.78/api/v1/user-accounts/";
    ProfileModel profileModelResponse;
    
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.putUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(profileModel.ProfileModelToJson()));
    HttpClientResponse response = await request.close();

    if(response.statusCode == 200){
      var data = jsonDecode(await response.transform(utf8.decoder).join());
      profileModelResponse = ProfileModel.fromJson(data);
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;   
  }
}