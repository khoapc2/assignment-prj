
import 'package:flutter/material.dart';

class RatePitch extends StatelessWidget{

  final int rates ;

  RatePitch(this.rates);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            child: Row(
            children:
            getAllStar()
          ),
        );
  }

  List<Icon> getStars(){
    return  List<Icon>.generate(rates, (i) => Icon(Icons.star,
      color: Colors.yellow[800]));
  }

  List<Icon> getNonStar(){
    return  List<Icon>.generate(5-rates, (i) => Icon(Icons.star_border,
        color: Colors.yellow[800]));
  }

  List<Widget> getAllStar(){
    List<Icon> stars = getStars();
    List<Icon> nonStars = getNonStar();
    List<Widget> allStars = new List.from(stars)..addAll(nonStars);
    return allStars;
  }
}