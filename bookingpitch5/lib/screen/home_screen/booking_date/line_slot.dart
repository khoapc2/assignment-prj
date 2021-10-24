import 'package:flutter/material.dart';

class LineSlot extends StatelessWidget{
  final String _title;
  LineSlot(this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Row(
        children: [
          Text(_title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Expanded(child:  Divider(
              color: Colors.black,

          ))

        ],
      ),
    );
  }
}