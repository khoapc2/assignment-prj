import 'package:flutter/material.dart';

class TimeBooking extends StatelessWidget{
  TimeBooking();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
      decoration: BoxDecoration(
         borderRadius:  BorderRadius.circular(25.0),
          color: Colors.grey
      ),
      child: ListTile(
        leading: Icon(Icons.alarm),
        title: Text("Mời bạn nhận sân vào lúc 13h 20/10/2021"),
      ),
    );
  }
}