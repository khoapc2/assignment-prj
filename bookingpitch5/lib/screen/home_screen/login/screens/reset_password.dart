import 'package:bookingpitch5/api/user_account_services.dart';
import 'package:flutter/material.dart';
import 'package:bookingpitch5/screen/home_screen/login//screens/login.dart';
import 'package:bookingpitch5/screen/home_screen/login//theme.dart';
import 'package:bookingpitch5/screen/home_screen/login//widgets/primary_button.dart';
import 'package:bookingpitch5/screen/home_screen/login//widgets/reset_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final searchValueController = TextEditingController();

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
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: searchValueController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: kTextFieldColor),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()  {
                  // if(buttonText == 'Đăng nhập'){
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Homescreen()),
                  //   )
                  // }
                  print(searchValueController.text);
                  UserAccountServices()
                      .checkAccount(searchValueController.text)
                      .then((value) {
                    setState(() {
                      print("value = " + value.toString());
                      if (value) {
                        Navigator.of(context).pushNamed('/createNewPassword',
                        arguments: searchValueController.text);
                      } else {
                        print("tài khoản không tồn tại");
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Tài khoản không tồn tại'),
                            content: Text("Vui lòng nhập lại tài khoản"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text(
                  "Cập nhật mật khẩu",
                  style: textButton.copyWith(color: kWhiteColor),
                ),
              ),
            )
            // GestureDetector(
            //     onTap: () {
            //       UserAccountServices().checkAccount(searchValueController.text).then(
            //               (value) {
            //                 setState(() {
            //                   if(value){
            //                     Navigator.of(context).pushNamed('/createNewPassword');
            //                   }
            //                   else{
            //                     print("tài khoản không tồn tại");
            //                     showDialog<String>(
            //                       context: context,
            //                       builder: (BuildContext context) => AlertDialog(
            //                         title: const Text('Tài khoản không tồn tại'),
            //                         content: Text("Vui lòng nhập lại tài khoản"),
            //                         actions: [
            //                           TextButton(
            //                             onPressed: () => Navigator.pop(context, 'OK'),
            //                             child: const Text('OK'),
            //                           ),
            //                         ],
            //                       ),
            //                     );
            //                   }
            //                 });
            //               }
            //       );

            // },
            // child: PrimaryButton('Reset Password')),
          ],
        ),
      ),
    );
  }
}
