import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypePitch extends StatelessWidget {
  final double _marginVertical;
  final double _marginHorizontal;
  final String _san5;
  final String _san7;
  final String _san11;
  final String _sanfusan;

  TypePitch(this._marginVertical, this._marginHorizontal, this._san5,
      this._san7, this._san11, this._sanfusan);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _marginHorizontal, vertical: _marginVertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/listSubPitch', arguments: "Sân 5");
              },
              child: Container(
                child: Column(
                  children: [Image.asset(_san5), Text("Sân 5")],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/listSubPitch', arguments: "Sân 7");
              },
              child: Container(
                child: Column(
                  children: [Image.asset(_san7), Text("Sân 7")],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/listSubPitch', arguments: "Sân 11");
              },
              child: Container(
                child: Column(
                  children: [Image.asset(_san11), Text("Sân 11")],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/listSubPitch', arguments: "Sân futsal");
              },
              child: Container(
                child: Column(
                  children: [Image.asset(_sanfusan), Text("Sân futsal")],
                ),
              )),
        ],
      ),
    );
  }
}
