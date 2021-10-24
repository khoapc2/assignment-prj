import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget{

  final String _location;
  final Color _color;
  MyLocation(this._location, this._color);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: BoxDecoration(
        color: _color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(color: _color),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(_location)
              ],
            ),
          ),
          Icon(Icons.favorite_outlined, color: Colors.pink[300],),
        ],
      ),
    );
  }
}