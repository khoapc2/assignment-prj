class ProfileModel {
  late String name;
  late String email;
  late String phone;
  late String address;
  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['address'] = address;
    return _data;
  }
}

