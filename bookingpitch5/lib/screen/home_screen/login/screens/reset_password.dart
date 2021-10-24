import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login//screens/login.dart';
import 'package:bookingpitch5/screen/home_screen/login//theme.dart';
import 'package:bookingpitch5/screen/home_screen/login//widgets/primary_button.dart';
import 'package:bookingpitch5/screen/home_screen/login//widgets/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Lấy lại mật khẩu',
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Nhập email của bạn',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            ResetForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ));
                },
                child: PrimaryButton('Reset Password')),
          ],
        ),
      ),
    );
  }
}
