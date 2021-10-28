// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserAccountPreference {
//   SharedPreferences? _preferences;
//   static const _keyToken = 'token';
//   static const _userID = 'id';
//   static const _role = 'role';
//
//   static Future init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   Future setUserToken(String token) async =>
//       await _preferences.setString(_keyToken, token);
//
//   Future setUserID(String id) async =>
//       await _preferences.setString(_userID, id);
//
//   Future setUserRole(String role) async =>
//       await _preferences.setString(_role, role);
//
//
//
//
//
// }