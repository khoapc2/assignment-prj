
import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';

import '../models/pitchs/pitch_model.dart';

class SubPitchServce{
  HttpClient client = HttpClient();

  Future<List<SubPitchModel>> getListSubPitchByTypeOfPitch(String TypeOfPitch) async {
    String url = "https://104.215.186.78/api/v1/subPitches?TypeOfPitch=" + TypeOfPitch;
    List<SubPitchModel> result = List.empty();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();

    if(response.statusCode == 200 ){
      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => SubPitchModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }
  }

  Future<List<SubPitchModel>> getListSubPitchByPitchId(int pitchId) async {
    print("Vô được trong SubPitchService");
    print("SubPitchId" + pitchId.toString());
    String url = "https://104.215.186.78/api/v1/subPitches?PitchId=" + pitchId.toString();
    List<SubPitchModel> result = List.empty();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();

    if(response.statusCode == 200 ){
      print("mã code là 200 trong getListSubPitch");
      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => SubPitchModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }
  }

  Future<SubPitchModel?> getSubPitchById(int SubPitchId) async {
    String url = "https://104.215.186.78/api/v1/subPitches/" + SubPitchId.toString();
    print("subpitchID trong service SubPitch: " + SubPitchId.toString());
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    SubPitchModel subPitchModel;
    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200 ){
      subPitchModel = SubPitchModel.fromJson(json.decode(response.body));
      return subPitchModel;
    }
    return null;
  }


}