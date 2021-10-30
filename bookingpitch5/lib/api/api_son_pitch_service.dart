import 'dart:convert';

import 'package:bookingpitch5/models/son_pitchs/son_pitch_model.dart';
import 'package:http/http.dart' as http;


class SonPitchService{
  String link = "https://104.215.186.78/";
  Future<bool> updatePitch(int motherPitch, int sonPitchID, int normalPrice, int specialPrice, String pitchName, String typeOfPitch) async {
    String url = link + "api/v1/subPitches/update-subPitch";
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id' : sonPitchID,
        'pitch_id' : motherPitch,
        'type_of_pitch' : typeOfPitch,
        'normal_day_price' : normalPrice,
        'special_day_price' : specialPrice,
        'status' : 1,
        'name' : pitchName
      }),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      throw Exception(Exception);
    }
  }


  Future<GetSonPitchModel> getSubPitchID(int pitchID) async {
    GetSonPitchModel pitch;
    String url = link + "api/v1/subPitches/" + pitchID.toString();
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      pitch = GetSonPitchModel.fromJson(json.decode(response.body));
    }else {
      throw Exception(Exception);
    }
    return pitch;
  }




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
      return true;
    } else {
      return false;
    }
  }

  //Maybe Delete
  Future<List<GetSonPitchModel>> getSonPitchModelByType(int motherPitchID, String typeOfPitch) async {
    List<GetSonPitchModel> listPitch = List.empty();
    String url = link + "api/v1/subPitches?PitchId=" + motherPitchID.toString() + "&TypeOfPitch=" +  typeOfPitch;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      listPitch = data.map((e) => GetSonPitchModel.fromJson(e)).toList();
      return listPitch;
    } else {
      return listPitch;
    }
  }

  Future<List<GetSonPitchModel>> getSonPitchModel(int motherPitchID) async {
    List<GetSonPitchModel> listPitch = List.empty();
    String url = link + "api/v1/subPitches?PitchId=" + motherPitchID.toString();
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      listPitch = data.map((e) => GetSonPitchModel.fromJson(e)).toList();
      return listPitch;
    } else {
      return listPitch;
    }
  }
}