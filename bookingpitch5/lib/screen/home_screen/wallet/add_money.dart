import 'package:flutter/material.dart';

class AddMoney extends StatelessWidget{
  AddMoney();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child:
      Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: ListTile(
          leading: Column(
            children: [
              Icon(Icons.arrow_upward, color: Colors.white,),
              Icon(Icons.money, color: Colors.white)
            ],
          ),
          title: Text("Nạp tiền", style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}