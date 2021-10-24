import 'package:bookingpitch5/api/api_login_service.dart';
import 'package:bookingpitch5/models/user_accounts/user_account.dart';
import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login/theme.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/Homescreen.dart';


TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

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


        // onChanged: (text){
        //   if(label == "Username") _username = text;
        //   if(label == "Password") _password = text;
        //
        //   print(_username + " hihi " + _password);
        //   print(label);
        //
        // },
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
  // final String buttonText;
  // final String _username;
  // final String _password;
  PrimaryButton();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          LoginRequestModel requestModel = new LoginRequestModel(username: _username.text, password: _password.text);

          APIService apiService = new APIService();
          apiService.login(requestModel).then((value) => {
            print(value),
              if(value.token.isNotEmpty){
              if(value.role == "owner"){
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
