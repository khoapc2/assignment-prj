import 'dart:convert';
import 'dart:io';
import 'package:bookingpitch5/models/mother_pitch_model.dart';

class CreatePitchService {
    Future<bool> createPitchModel(CreatePitchModel createPitchModel) async {
    String link = "https://104.215.186.78/";
    String url = link + "api/Pitches";

    HttpClient client = HttpClient();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request =
    await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(createPitchModel.CreateModelToJson()));
    HttpClientResponse response = await request.close();
    if(response.statusCode == 200 || response.statusCode == 400){
      return true;
    } else {
      return false;
    }
  }
}