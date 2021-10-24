import 'package:bookingpitch5/screen/home_screen/booking_date/main_screen.dart';
import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  DoneButton();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Container(
        constraints: BoxConstraints.expand(
            height: 50.0
        ),
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green
        ),

        child:
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/');
          } ,
          child:  Center(
              child: Text("Về trang chủ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                  textAlign: TextAlign.center)),
        )

      );

  }
}
