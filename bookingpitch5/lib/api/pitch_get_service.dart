
import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pitchs/pitch_model.dart';

class PitchServce {
  HttpClient client = HttpClient();

  Future<List<PitchModel>> getListPitchByName(String searchValue) async {
    String url = "https://104.215.186.78/api/Pitches?Name=" + searchValue +
        "&pageIndex=1&pageSize=10";
    List<PitchModel> result = List.empty();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();
    print(searchValue);

    if (response.statusCode == 200) {

      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => PitchModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }
  }

  Future<List<PitchModel>> getListHightRatePitches() async {
    String url = "https://104.215.186.78/api/Pitches/get_highest_rates";
    List<PitchModel> result = List.empty();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();
    print("Hêlo");
    if (response.statusCode == 200) {
      print("Hêlo");
      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => PitchModel.fromJson(e)).toList();
      print("trong service"+result.length.toString());
      return result;
    } else {
      return result;
    }
  }

  Future<PitchModel> getPitchById(int id) async {
    String url = "https://104.215.186.78/api/Pitches/" + id.toString();
    print("Tên id sân mẹ trong service: "+ id.toString());
    PitchModel profileModelResponse;

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });


    if(response.statusCode == 200){
      profileModelResponse = PitchModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;
  }

  Future<List<PitchModel>> getRecommandPitches() async {
    String url = "https://104.215.186.78/api/Pitches/get_recomand_pitch";
    List<PitchModel> result = List.empty();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => PitchModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }
  }

  // Future<PitchModel> getProfileById(int id) async {
  //   String url = "https://104.215.186.78/api/v1/user-accounts/" + id.toString();
  //
  //   PitchModel profileModelResponse;
  //
  //   final response = await http.get(Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       });
  //
  //
  //   if(response.statusCode == 200){
  //     profileModelResponse = ProfileModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(Exception);
  //   }
  //   return profileModelResponse;
  // }
}