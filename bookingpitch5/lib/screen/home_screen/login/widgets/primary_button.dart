import 'package:bookingpitch5/screen/home_screen/main_screen/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login/theme.dart';
import 'package:bookingpitch5/screen/home_screen/login//screens/reset_password.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  PrimaryButton(this.buttonText);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => {
          if(buttonText == 'Đăng nhập'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
            )
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        child: Text(
          buttonText,
          style: textButton.copyWith(color: kWhiteColor),
        ),
      ),
    );
  }
}