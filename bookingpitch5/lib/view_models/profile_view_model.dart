
import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:bookingpitch5/api/api_get_profile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel {

  static String validateUpdateProfile(
      String fullname,
      String email,
      String phone,
      String address) {
    var error = '';

    if (fullname.length < 1 || fullname.length > 50)
      error += 'Fullname is required and length <= 50\n';
    if (email.length > 50) error += 'Email length must <= 50\n';
    if (phone.length != 10)
      error += 'Phone is required and length must = 10 characters\n';
    if (address.length > 50) error += 'Address length must <= 50\n';
    return error;
  }
  
  Future<ProfileModel> getProfile() 
    async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id');
      ProfileService serives = new ProfileService();
      var profile = await serives.getProfileById(id);
        return profile;
    }

  Future<ProfileModel> updateProfile(ProfileModel profileModel) 
    async {
      ProfileService serives = new ProfileService();
      var profile = await serives.updateProfile(profileModel);
        return profile;
    }
}