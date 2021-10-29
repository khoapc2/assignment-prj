import 'dart:convert';

import 'package:bookingpitch5/models/son_pitchs/son_pitch_model.dart';
import 'package:http/http.dart' as http;


class SonPitchService{
  String link = "https://104.215.186.78/";

  Future<bool> createSonPitchModel(CreateSonPitchModel createSonPitchModel) async {
    String url = link + "api/v1/subPitches";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'pitch_id' : createSonPitchModel.mother_pitch_id,
        'type_of_pitch' : createSonPitchModel.type_of_pitch,
        'normal_day_price' : createSonPitchModel.normal_day_price,
        'special_day_price' : createSonPitchModel.special_day_price,
        'name' : createSonPitchModel.pitchName,
      }),
    );
    if(response.statusCode == 200 || response.statusCode == 201){
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }






}