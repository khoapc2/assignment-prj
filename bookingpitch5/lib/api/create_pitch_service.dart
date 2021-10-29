import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bookingpitch5/models/mother_pitch_model.dart';

class PitchService {
    String link = "https://104.215.186.78/";
    //Waiting To Fix
    Future<bool> deletePitch(int motherPitchID) async {
        String url = link + "api/Pitches?id="+ motherPitchID.toString();
        final response = await http.delete(
            Uri.parse(url),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
        );
        if (response.statusCode == 200 || response.statusCode == 400) {
            return true;
        } else {
            return false;
        }
    }

    Future<bool> createPitchModel(CreatePitchModel createPitchModel) async {
    String url = link + "api/Pitches";
    final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
            'pitch_owner_id' : createPitchModel.owner_id,
            'name' : createPitchModel.pitchName,
            'location' : createPitchModel.address,
            'time_start' : createPitchModel.timeStart,
            'time_end' : createPitchModel.timeEnd,
            'phone' : createPitchModel.phone,
        }),
    );
    if(response.statusCode == 200 || response.statusCode == 400){
      return true;
    } else {
      return false;
    }
  }

    Future<List<GetPitchModel>> getPitchModel(int ownerId) async {
        List<GetPitchModel> listPitch = List.empty();
        String url = link + "api/Pitches?PitchOwnerId=" + ownerId.toString() +
            "&Status=1&pageIndex=1&pageSize=50";

        final response = await http.get(
            Uri.parse(url),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
        );

        if (response.statusCode == 200 || response.statusCode == 400) {
            List data = jsonDecode(response.body);
            listPitch = data.map((e) => GetPitchModel.fromJson(e)).toList();
            return listPitch;
        } else {
            return listPitch;
        }
    }

    Future<GetPitchModel> getPitchID(int pitchID) async {
        GetPitchModel pitch;
        String url = link + "api/Pitches?Id=1";
        final response = await http.get(
            Uri.parse(url),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
        );
        if (response.statusCode == 200) {
            pitch = new GetPitchModel.fromJson(jsonDecode(response.body));
        }else {
            throw Exception(Exception);
        }
        return pitch;
    }
}