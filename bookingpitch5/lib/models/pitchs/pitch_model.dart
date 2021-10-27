class PitchModel {
  late int id;
  late int pitch_owner_id;
  late String name;
  late String location;
  late String img_path;
  late String phone;
  late String time_start;
  late String time_end;
  late int rates;
  late int status;


  PitchModel(this.id, this.pitch_owner_id, this.name, this.location,
      this.img_path, this.phone, this.time_start, this.time_end, this.rates,
      this.status);

  PitchModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pitch_owner_id = json['pitch_owner_id'];
    name = json['name'];
    location = json['location'];
    img_path = json['img_path'];
    phone = json['phone'];
    time_start = json['time_start'];
    time_end = json['time_end'];
    rates = json['rates'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pitch_owner_id'] = pitch_owner_id;
    _data['name'] = name;
    _data['location'] = location;
    _data['img_path'] = img_path;
    _data['phone'] = phone;
    _data['time_start'] = time_start;
    _data['time_end'] = time_end;
    _data['rates'] = rates;
    _data['status'] = status;
    return _data;
  }
}