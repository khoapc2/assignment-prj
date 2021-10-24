import 'package:flutter/material.dart';

class LineSlot extends StatelessWidget{
  LineSlot();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Row(
        children: [
          Text("Chọn khung giờ",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(child:  Divider(
              color: Colors.black,

          ))

        ],
      ),
    );
  }
}