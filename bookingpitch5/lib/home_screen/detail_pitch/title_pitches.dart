import 'package:flutter/material.dart';

class TitlePitch extends StatelessWidget{
  final double _marginVertical;
  final double _marginHorizontal;
  final String _title;
  final double _fontWeight;
  TitlePitch(this._marginVertical , this._marginHorizontal, this._title, this._fontWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: _marginVertical,
          horizontal: _marginHorizontal
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(1,0,1,0)
          ,child: Text(_title,style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: _fontWeight))),
    );
  }
}