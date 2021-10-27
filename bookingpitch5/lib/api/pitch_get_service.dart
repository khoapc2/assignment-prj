
import 'dart:io';

import 'package:bookingpitch5/models/pitchs/pitch_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PitchServce{
  HttpClient client = HttpClient();

  Future<List<PitchModel>> getListPitchByName(String searchValue) async {
    String url = "https://localhost:44322/api/Pitches?Name=" + searchValue+"&pageIndex=1&pageSize=1";
    List<PitchModel> result = List.empty();
    HttpClientRequest request =
    await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();
    print(searchValue);

    if(response.statusCode == 200 ){
      List ds = jsonDecode(await response.transform(utf8.decoder).join());
      result = ds.map((e) => PitchModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }

  }
}