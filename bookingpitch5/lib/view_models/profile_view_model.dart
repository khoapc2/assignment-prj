
import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:bookingpitch5/api/api_get_profile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel {
  
  Future<ProfileModel> getProfile() 
    async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id');
      ProfileService serives = new ProfileService();
      var profile = await serives.getProfileById(id);
        return profile;
    }

  
}