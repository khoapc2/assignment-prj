class SubPitchModel {
  late int id;
  late String pitch_name;
  late String name;
  late String img_path;
  late String typeOfPitch;
  late int normalDay;
  late int SpecialDayPrice;
  late int status;


  SubPitchModel(this.id, this.pitch_name, this.name, this.img_path,
      this.typeOfPitch, this.normalDay, this.SpecialDayPrice, this.status);

  SubPitchModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pitch_name = json['pitch_name'];
    name = json['name'];
    img_path = json['img_path'];
    typeOfPitch = json['typeOfPitch'];
    normalDay = json['normalDay'];
    SpecialDayPrice = json['SpecialDayPrice'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pitch_name'] = pitch_name;
    _data['name'] = name;
    _data['img_path'] = img_path;
    _data['typeOfPitch'] = typeOfPitch;
    _data['normalDay'] = normalDay;
    _data['SpecialDayPrice'] = SpecialDayPrice;
    _data['status'] = status;
    return _data;
  }
}