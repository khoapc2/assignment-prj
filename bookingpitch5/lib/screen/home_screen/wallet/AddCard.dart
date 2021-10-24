import 'package:flutter/material.dart';

class ButtonAddCard extends StatelessWidget{
  ButtonAddCard();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: ListTile(
          leading: Icon(Icons.credit_card, color: Colors.white),
          title:
          Column(
            children: [
              Text("Thêm thẻ",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              Text("thanh toán dễ dàng hơn với thẻ tín dụng",
                  style :TextStyle(
                      color: Colors.white
                  ))
            ],
          ),
        ),
      );
  }
}