import 'package:bookingpitch5/api/user_account_services.dart';
import 'package:bookingpitch5/models/sign_up_model.dart';

class SignUpViewModel {
  static String validateSignUp(
      String fullname,
      String email,
      String phone,
      String address,
      String username,
      String password,
      String confirmPassword) {
    var error = '';

    if (fullname.length < 1 || fullname.length > 50)
      error += 'Fullname is required and length <= 50\n';
    if (email.length > 50) error += 'Email length must <= 50\n';
    if (phone.length != 10)
      error += 'Phone is required and length must = 10 characters\n';
    if (address.length > 50) error += 'Address length must <= 50\n';
    if (username.length < 1 || username.length > 20)
      error += 'Username is required and length <= 20\n';
    if (password.length < 1 || password.length > 20)
      error += 'Password is required and length <= 20\n';
    if (confirmPassword.length < 1 || password.length > 20)
      error += 'Confirm Password is required and length <= 20\n';
    if (password != confirmPassword)
      error += 'Password and Confirm Password is not matched!';
    return error;
  }

  static Future<bool> registerAccount(
    String fullname, 
    String email,
    String phone, 
    String address, 
    String username, 
    String password) async {
    UserAccountServices serives = new UserAccountServices();
    var isRegister = await serives.SignUp(
        new SignUpModel(fullname, email, phone, address, username, password));
        return isRegister;
  }
}
