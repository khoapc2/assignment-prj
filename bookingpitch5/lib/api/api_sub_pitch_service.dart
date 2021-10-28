
import 'dart:io';

import 'dart:convert';

import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';

import '../models/pitchs/pitch_model.dart';

class SubPitchServce{
  HttpClient client = HttpClient();

  Future<List<SubPitchModel>> getListSubPitchByTypeOfPitch(String TypeOfPitch) async {
    String url = "......" + TypeOfPitch+"........";
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


}