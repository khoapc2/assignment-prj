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
