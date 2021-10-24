import 'package:flutter/material.dart';

class SearchValue extends StatelessWidget{
  final double _marginVertical;
  final double _marginHorizontal;
  SearchValue(this._marginVertical , this._marginHorizontal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(
        height: 35.0
      ),
      margin: EdgeInsets.symmetric(
        vertical: _marginVertical,
        horizontal: _marginHorizontal
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        decoration: InputDecoration(
          hintText: 'Bạn muốn tìm sân bóng nào',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.sports_soccer),
          hoverColor: Colors.black,
        ),

      ),
    );
  }
}