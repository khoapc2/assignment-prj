import 'package:bookingpitch5/view_models/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login/theme.dart';

TextEditingController edtFullname = new TextEditingController();
TextEditingController edtEmail = new TextEditingController();
TextEditingController edtPhone = new TextEditingController();
TextEditingController edtAddress = new TextEditingController();
TextEditingController edtUsername = new TextEditingController();
TextEditingController edtPassword = new TextEditingController();
TextEditingController edtConfirmPassword = new TextEditingController();

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kDefaultPadding,
          child: Column(children: [
            buildInputForm('Full Name', false, edtFullname),
            buildInputForm('Email', false, edtEmail),
            buildInputForm('Phone', false, edtPhone),
            buildInputForm('Address', false, edtAddress),
            buildInputForm('Username', false, edtUsername),
            buildInputForm('Password', true, edtPassword),
            buildInputForm('Confirm Password', true, edtConfirmPassword),
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: kDefaultPadding,
          child: PrimaryButton('Sign Up'),
        ),
      ],
    );
  }

  Padding buildInputForm(
      String hint, bool pass, TextEditingController editingController) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          controller: editingController,
          keyboardType: hint == 'Phone' ? TextInputType.phone : null,
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
  }
}

class PrimaryButton extends StatefulWidget {
  final String buttonText;
  var fullname, email, phone, address, username, password, confirmPassword;
  PrimaryButton(this.buttonText);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  String error = '';
  bool isRegister = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async => {
          error = SignUpViewModel.validateSignUp(
              edtFullname.text,
              edtEmail.text,
              edtPhone.text,
              edtAddress.text,
              edtUsername.text,
              edtPassword.text,
              edtConfirmPassword.text),
          if (error.length > 0)
            {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Đăng ký thất bại'),
                  content: Text(error),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            }
          else
            {
              isRegister = await SignUpViewModel.registerAccount(
                  edtFullname.text,
                  edtEmail.text,
                  edtPhone.text,
                  edtAddress.text,
                  edtUsername.text,
                  edtPassword.text),
                  if(isRegister) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Đăng ký thành công'),
                        content: Text('Đăng ký thành công!!!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pushNamed('/login'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    )
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Đăng ký thất bại'),
                        content: Text('Username đã tồn tại!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    )
                  }
            },
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text(
          widget.buttonText,
          style: textButton.copyWith(color: kWhiteColor),
        ),
      ),
    );
  }
}
