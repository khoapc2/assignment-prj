import 'package:bookingpitch5/api/user_account_services.dart';

class UserAccount{
  static Future<bool> checkUserName(String Username)
  async {
    UserAccountServices serives = new UserAccountServices();
    var result = await serives.checkAccount(Username);
    return result;
  }
}