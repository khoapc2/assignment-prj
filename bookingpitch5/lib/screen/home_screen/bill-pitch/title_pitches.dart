import 'package:flutter/material.dart';

class TitlePitch extends StatelessWidget{

  TitlePitch();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(1,0,1,0)
          ,child:
          ListTile(
            leading: Icon(Icons.check_circle,size: 50.0,color: Colors.green,),
            title: Text("Đặt sân thành công",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
          )
      ,
          );
  }
}