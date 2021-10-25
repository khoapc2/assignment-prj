class ProfileModel {
  late int id;
  late String username;
  late String password;
  late String name;
  late String email;
  late String phone;
  late String address;
  late String status;
  late String role;
  ProfileModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.status,
    required this.role,
  });
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['password'] = password;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['status'] = status;
    _data['role'] = role;
    return _data;
  }
}

