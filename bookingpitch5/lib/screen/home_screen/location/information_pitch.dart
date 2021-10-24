import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget{
  Information();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sân 5| Khu Liên hiệp thể thao TNG", ),
          Text("500,000 đ - Sân 5 - Thanh toán tiền mặt"),
          Text("Nguyễn Văn Á - 0123456789"),
          Text("13:00 -14:00| Sân A3")
        ],
      ),
    );
  }
}