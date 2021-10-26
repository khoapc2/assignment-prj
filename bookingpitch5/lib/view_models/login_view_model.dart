import 'package:bookingpitch5/api/api_login_service.dart';
import 'package:bookingpitch5/models/user_accounts/user_account.dart';

class LoginViewModel {
  Future<LoginResponseModel> getLoginResponse(LoginRequestModel loginRequestModel)
  async {
    LoginService services = new LoginService();
    var response = await services.login(loginRequestModel);
    return response;
  }
}