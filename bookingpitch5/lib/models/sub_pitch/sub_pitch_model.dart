class SubPitchModel {
  late int id;
  late String pitch_name;
  late int pitch_id;
  late String name;
  late String img_path;
  late String typeOfPitch;
  late int normalDay;
  late int SpecialDayPrice;
  late int status;


  SubPitchModel(this.id, this.pitch_name, this.pitch_id,this.name, this.img_path,
      this.typeOfPitch, this.normalDay, this.SpecialDayPrice, this.status);

  SubPitchModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pitch_name = json['pitch_name'];
    pitch_id = json['pitch_id'];
    name = json['name'];
    img_path = json['img_path'];
    typeOfPitch = json['type_of_pitch'];
    normalDay = json['normal_day_price'];
    SpecialDayPrice = json['special_day_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pitch_name'] = pitch_name;
    _data['pitch_id'] = pitch_id;
    _data['name'] = name;
    _data['img_path'] = img_path;
    _data['type_of_pitch'] = typeOfPitch;
    _data['normal_day_price'] = normalDay;
    _data['special_day_price'] = SpecialDayPrice;
    _data['status'] = status;
    return _data;
  }
}