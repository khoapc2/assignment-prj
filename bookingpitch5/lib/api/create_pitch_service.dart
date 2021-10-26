import 'dart:convert';
import 'dart:io';
import 'package:bookingpitch5/models/mother_pitch_model.dart';

class CreatePitchService {
    Future<bool> createPitchModel(CreatePitchModel createPitchModel) async {
    String link = "https://localhost:44322/";
    String url = link + "api/v1/user-accounts/login";

    HttpClient client = HttpClient();

    // final response = await http.post(Uri.parse(url),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   // body: jsonEncode(<String, String>{
    //   //   'pitch_owner_id' : createPitchModel.owner_id,
    //   //   'name' : createPitchModel.pitchName,
    //   //   'location' : createPitchModel.address,
    //   //   'time_start' : createPitchModel.timeStart,
    //   //   'time_end' : createPitchModel.timeEnd,
    //   // }),
    //
    //     request.add(utf8.encode(model.SignUpModelToJson()));
    //     HttpClientResponse response = await request.close();

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
      String r = await response.transform(utf8.decoder).join();
      print(response.statusCode);
      return false;
    }
  }
}