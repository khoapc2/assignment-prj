import 'package:flutter/material.dart';

class Contact extends StatelessWidget{
  Contact();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      ListTile(
      leading: Icon(Icons.headset, color: Colors.green,),
      title: Text("Liên hệ chủ sân"),

      trailing:
      Row(
          mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.phone, color: Colors.green,),
          Icon(Icons.mail, color: Colors.green,)
        ],
      )
    );
  }
}