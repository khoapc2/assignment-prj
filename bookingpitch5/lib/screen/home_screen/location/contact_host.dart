import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  var phone;
  Contact(this.phone);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          SizedBox(width: 10),
          Icon(Icons.headset, color: Colors.green),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Liên hệ chủ sân", style: TextStyle(fontWeight: FontWeight.bold)), Text(phone)],
          )
        ]),
        Row(children: [
          Icon(Icons.phone, color: Colors.green,),
          SizedBox(width: 10),
          Icon(Icons.mail, color: Colors.green,),
          SizedBox(width: 10)
        ])
      ],
    );

    //   ListTile(
    //   leading: Icon(Icons.headset, color: Colors.green,),
    //   title: Text("Liên hệ chủ sân"),

    //   trailing:
    //   Row(
    //       mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Icon(Icons.phone, color: Colors.green,),
    //       Icon(Icons.mail, color: Colors.green,)
    //     ],
    //   )
    // );
  }
}
