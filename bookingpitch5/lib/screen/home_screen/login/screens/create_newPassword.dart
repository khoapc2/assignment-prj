import 'package:bookingpitch5/screen/home_screen/login/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CreateNewPassword extends StatefulWidget {
  String userName;
  CreateNewPassword(this.userName);
  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final newPassword = TextEditingController();
  final conFirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: Padding(
            padding: kDefaultPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: newPassword,
                  decoration: InputDecoration(
                      hintText: 'new Password',
                      hintStyle: TextStyle(color: kTextFieldColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: conFirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'confirm Password',
                      hintStyle: TextStyle(color: kTextFieldColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         if (conFirmPassword != newPassword) {
              //           showDialog<String>(
              //             context: context,
              //             builder: (BuildContext context) => AlertDialog(
              //               title: const Text('2 mật khẩu không trùng khớp'),
              //               content: Text(
              //                   "Kiểm tra lại mật khẩu mới và mật khẩu xác thực"),
              //               actions: [
              //                 TextButton(
              //                   onPressed: () => Navigator.pop(context, 'OK'),
              //                   child: const Text('OK'),
              //                 ),
              //               ],
              //             ),
              //           );
              //         } else {
              //           showDialog<String>(
              //             context: context,
              //             builder: (BuildContext context) => AlertDialog(
              //               title: const Text('2 mật khẩu không trùng khớp'),
              //               content: Text(
              //                   "Kiểm tra lại mật khẩu mới và mật khẩu xác thực"),
              //               actions: [
              //                 TextButton(
              //                   onPressed: () => Navigator.pop(context, 'OK'),
              //                   child: const Text('OK'),
              //                 ),
              //               ],
              //             ),
              //           );
              //         }
              //       });
              //     },
              //     child: PrimaryButton('Reset Password')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // print("mật khẩu mới: " + newPassword.text);
                      // print("mật khẩu xác thực: " + newPassword.text);

                      if (conFirmPassword.text != newPassword.text) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('2 mật khẩu không trùng khớp'),
                            content: Text(
                                "Kiểm tra lại mật khẩu mới và mật khẩu xác thực"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Tạo mới thanh công'),
                            content: Text(
                                "Quay về màn hình chính"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                } ,
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Text(
                    "Cập nhật",
                    style: textButton.copyWith(color: kWhiteColor),
                  ),
                ),
              )
            ])));
  }
}
