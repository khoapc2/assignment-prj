import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  final double _marginVertical;
  final double _marginHorizontal;
  VoucherItem(this._marginVertical, this._marginHorizontal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/listPitch'),
        child: Container(
          height: 80.0,
          padding: EdgeInsets.only(left: 20.0),
          margin: EdgeInsets.symmetric(
              vertical: _marginVertical, horizontal: _marginHorizontal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Image(
                    image: AssetImage("assets/images/iconBall.png"),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mừng MU thua YB ", style: TextStyle(fontSize: 20)),
                    Text("HSD: 10/12/2021 ", style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
