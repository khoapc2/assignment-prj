import 'package:bookingpitch5/screen/home_screen/footer_menu.dart';
import 'package:bookingpitch5/screen/home_screen/wallet/add_money.dart';
import 'package:flutter/material.dart';

import 'AddCard.dart';

class Wallet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
        },
      child: Icon(Icons.arrow_back)),
      title: Text("Thông tin đặt sân"),
      backgroundColor: Colors.green,
    ),
      body:
      Column(
        children: [
          ButtonAddCard(),
          AddMoney()
        ],
      ),

      bottomNavigationBar: FooterMenu(2),
    );
  }
}