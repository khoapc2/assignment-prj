import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '';

class CalendarContainer extends StatelessWidget{
  final DateTime FocusedDate;
  CalendarContainer(this.FocusedDate);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(FocusedDate);
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12.0)
      ),
      constraints: BoxConstraints.expand(height: 50.0),
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      child: Row(
        children: [
          Icon(Icons.calendar_today_sharp),
           Expanded(
               child: Center(
                   child : Text(formattedDate,
                       style : TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
               )),

        ],
      )
    );
  }
}