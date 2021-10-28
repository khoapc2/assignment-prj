import 'package:bookingpitch5/api/api_login_service.dart';
import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  Future<LoginResponseModel> getLoginResponse(LoginRequestModel loginRequestModel)
  async {
    LoginService services = new LoginService();
    var response = await services.login(loginRequestModel);
    return response;
  }

  static Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role');   
    return role;
  }
}