import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget{

  ImageBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.expand(
        //height: 100.0,
      //),
        margin: EdgeInsets.symmetric(
            vertical: 20.0,
        ),
      constraints: BoxConstraints.expand(
        height: 100.0
      ),
      child: Image.asset("assets/images/circle.png"),
    );
  }

}