import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget{
  final String _assetPath;
  final Color _color;

  ImageBanner(this._assetPath, this._color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: _color),
      child: Image.asset(_assetPath, fit: BoxFit.fill),
    );
  }

}