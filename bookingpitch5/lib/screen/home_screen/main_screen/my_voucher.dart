import 'package:flutter/material.dart';

class MyVoucher extends StatelessWidget {
  final double _marginVertical;
  final double _marginHorizontal;

  MyVoucher(this._marginVertical, this._marginHorizontal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/vourcher');
          },
          child: Container(
              constraints: BoxConstraints.expand(
                  height: 35.0
              ),
              margin: EdgeInsets.symmetric(
                  vertical: _marginVertical,
                  horizontal: _marginHorizontal
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Bạn ơi có 4 mã giảm giá chưa xài nè ", 
                      style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),)
                  ,
                  Icon(Icons.arrow_forward_ios)
                ],
              )

          )
      );
  }
}

