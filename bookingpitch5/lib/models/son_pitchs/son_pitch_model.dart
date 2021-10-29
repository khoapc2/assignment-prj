// "type_of_pitch": "Sân 5",
// "normal_day_price": 0,
// "special_day_price": 0,
// "name": "string"

class CreateSonPitchModel {
  String pitchName;
  String type_of_pitch;
  int mother_pitch_id;
  int normal_day_price;
  int special_day_price;
  CreateSonPitchModel(this.pitchName, this.type_of_pitch, this.mother_pitch_id, this.normal_day_price, this.special_day_price);

  Map<String, dynamic> toJson() => {
    'type_of_pitch' : type_of_pitch,
    'normal_day_price' : normal_day_price,
    'pitch_id' : mother_pitch_id,
    'special_day_price' : special_day_price,
    'name' : pitchName,
  };
}