
import 'package:bookingpitch5/models/user_accounts/profile_model.dart';
import 'package:bookingpitch5/api/api_get_profile.dart';


class ProfileViewModel {
  Future<ProfileModel> getProfile() 
    async {
      ProfileService serives = new ProfileService();
      var profile = await serives.getProfileById();
        return profile;
    }
}