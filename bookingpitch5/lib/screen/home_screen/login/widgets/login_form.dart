import 'package:bookingpitch5/api/api_login_service.dart';
import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login/theme.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();
int id = 1;
class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();

}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Username', false, _username),
        buildInputForm('Password', true, _password),
        PrimaryButton()
      ],
    );
  }


  Padding buildInputForm(String label, bool pass, TextEditingController _controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: _controller,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? Icon(
                            Icons.visibility_off,
                            color: kTextFieldColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                  )
                : null),
      ),
    );
  }
}
class PrimaryButton extends StatelessWidget {
  Future<void> _setToReference(String token, int id, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print(prefs.getString('token'));
    await prefs.setInt('id', id);
    await prefs.setString('role',role);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ()  {
          LoginRequestModel requestModel = new LoginRequestModel(username: _username.text, password: _password.text);
          APIService apiService = new APIService();
           apiService.login(requestModel).then((value) async => {
              if(value.token.isNotEmpty){
                // await UserAccountPreference.set
                if(value.role == "owner"){
                  _setToReference(value.token, value.id, value.role),
                  Navigator.of(context).pushNamed('/mainScreenHost'),
               }else if(value.role == "customer"){
                  _setToReference(value.token, value.id, value.role),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  )
                }
              }
            });
          },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text(
          "Đăng Nhập",
          style: textButton.copyWith(color: kWhiteColor),
        ),
      ),
    );
  }
}
