import 'dart:convert';

class CreatePitchModel {
  int owner_id;
  String pitchName;
  String address;
  String phone;
  String timeStart;
  String timeEnd;
  CreatePitchModel(this.owner_id, this.pitchName, this.phone, this.address,
      this.timeStart, this.timeEnd);

  Map<String, dynamic> toJson() => {
    'pitch_owner_id' : owner_id,
    'name' : pitchName,
    'location' : address,
    'time_start' : timeStart,
    'time_end' : timeEnd,
    'phone' : phone,
  };

  String CreateModelToJson() => json.encode(toJson());
}

class GetPitchModel {
  int idPitch;
  int pitch_owner_id;
  String name;
  String location;
  String img_path;
  String phone;
  String time_start;
  String time_end;

  GetPitchModel({
    required this.idPitch,
    required this.pitch_owner_id,
    required this.name,
    required this.location,
    required this.img_path,
    required this.phone,
    required this.time_start,
    required this.time_end,
  });

  factory GetPitchModel.fromJson(Map<String, dynamic> json) {
    return new GetPitchModel(
        idPitch : json['id'],
        pitch_owner_id : json['pitch_owner_id'],
        name : json['name'],
        location : json['location'],
        img_path : json['img_path'],
        phone : json['phone'],
        time_start : json['time_start'],
        time_end : json['time_end']
    );
  }
}


class GetPitchModelDetail {
  late int idPitch;
  late int pitch_owner_id;
  late String name;
  late String location;
  late String img_path;
  late String phone;
  late String time_start;
  late String time_end;

  GetPitchModelDetail({
    required this.idPitch,
    required this.pitch_owner_id,
    required this.name,
    required this.location,
    required this.img_path,
    required this.phone,
    required this.time_start,
    required this.time_end,
  });

  GetPitchModelDetail.fromJson(Map<String, dynamic> json) {
  idPitch = json['id'];
  pitch_owner_id = json['pitch_owner_id'];
  name = json['name'];
  location = json['location'];
  img_path = json['img_path'];
  phone = json['phone'];
  time_start = json['time_start'];
  time_end = json['time_end'];
  }
}