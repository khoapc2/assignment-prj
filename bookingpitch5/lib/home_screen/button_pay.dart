import 'package:flutter/material.dart';

class ButtonPay extends StatelessWidget {
  ButtonPay();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(
            height: 50.0
        ),
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green
        ),

              child: ListTile(
                  leading: Icon(Icons.add,color: Colors.white),
                  title: Text("Thêm cơ sở",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center, )),
            ),
      onTap: () => Navigator.of(context).pushNamed('/addMotherPitch'),
    );

  }
}
