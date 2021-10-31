import 'package:bookingpitch5/models/tranfer_params/pitchId_and_rate.dart';
import 'package:bookingpitch5/screen/home_screen/rate_and_feedback_pitch/ratingactivity.dart';
import 'package:bookingpitch5/screen/home_screen/view_feedback/view_feedback.dart';
import 'package:flutter/material.dart';

class RatePitch extends StatelessWidget {
  final double _marginVertical;
  final double _marginHorizontal;

  final double rates;
  final int pitchID;

  RatePitch(
      this._marginVertical, this._marginHorizontal, this.rates, this.pitchID);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: _marginVertical, horizontal: _marginHorizontal),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(child: ViewFeedback())
        ],
      ),
    );
  }

  Row ViewFeedback() {
    return Row(
      children: [FeedbackButton(pitchID, rates)],
    );
  }
}

class FeedbackButton extends StatelessWidget {
  final double _rates;
  final int _pitchID;
  FeedbackButton(this._pitchID, this._rates);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            return Colors.green; // Use the component's default.
          },
        ),
      ),
      onPressed: () => Navigator.of(context).pushNamed('/view_feedback',
          arguments: new PitchID_Rate(pitchId: _pitchID, rate: _rates)),
      child:
          Row(children: [ 
            Text('Xem bình luận ' + '(' + _rates.toString() , 
                style: TextStyle(color: Colors.yellow, fontSize: 18)),
            Icon(Icons.star_rate_sharp, color: Colors.yellow),
            Text(')', style: TextStyle(color: Colors.yellow, fontSize: 18))
            ]
            
          ),
    );
  }
}
