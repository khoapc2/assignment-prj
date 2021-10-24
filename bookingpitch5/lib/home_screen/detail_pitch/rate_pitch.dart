
import 'package:flutter/material.dart';

class RatePitch extends StatelessWidget{
  final double _marginVertical;
  final double _marginHorizontal;
  final int rates ;

  RatePitch(this._marginVertical , this._marginHorizontal, this.rates);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: _marginVertical,
          horizontal: _marginHorizontal
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
            children:
            getAllStar()
          ),
        ),
          Icon(Icons.favorite_border)
          ]
        ,
      ),
    );
  }

  List<Icon> getStars(){
    return  List<Icon>.generate(rates, (i) => Icon(Icons.star,
      color: Colors.yellow));
  }

  List<Icon> getNonStar(){
    return  List<Icon>.generate(5-rates, (i) => Icon(Icons.star_border,
        color: Colors.yellow));
  }

  List<Widget> getAllStar(){
    List<Icon> stars = getStars();
    List<Icon> nonStars = getNonStar();
    List<Widget> allStars = new List.from(stars)..addAll(nonStars);
    allStars.add(
      Row(
        children: [
          Text(rates.toString() + "." +"999+"),
          FeedbackButton()
        ],
      )
      );
    return allStars;
  }
}

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/feedback'),
      child: const Text('Bình luận'),
    );
  }
}