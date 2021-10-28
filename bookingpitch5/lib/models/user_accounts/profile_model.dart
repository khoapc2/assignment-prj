import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String address;
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }


  
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['address'] = address;
    return _data;
  }

  String ProfileModelToJson() => json.encode(toJson());
}

