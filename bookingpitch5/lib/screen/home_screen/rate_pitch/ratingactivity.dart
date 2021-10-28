import 'package:bookingpitch5/view_models/feedback_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

TextEditingController feedbackEdt = new TextEditingController();
int rated = 3;
int pitch_id = 1;
int booking_id = 1;
bool result = true;

class RatingScreen extends StatelessWidget {
  var pitchID_BookingID;
  RatingScreen(this.pitchID_BookingID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Đánh Giá Sân Bóng',
                  style: TextStyle(color: Colors.black.withOpacity(1)))
            ],
          ),
          backgroundColor: Colors.green,
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Image(
                image: AssetImage('assets/images/footballpitch1.jpg'),
                width: 500,
                height: 150,
                fit: BoxFit.fill),
            RatingStar(),
            Comment(),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(25),
          child: FlatButton(
            child: Text(
              'Gửi',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () async {
              result = await FeedbackViewModel().createFeedback(
                  pitch_id, feedbackEdt.text, rated, booking_id);
              print(feedbackEdt.text);
              if (result) {
                feedbackEdt.text = '';
                FocusScope.of(context).requestFocus(new FocusNode());
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Feedback thành công'),
                    content: Text('Cảm ơn em iu của anh <3'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Feedback thất bại'),
                    content: Text(':(((('),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            padding: EdgeInsets.all(15),
          ),
        ));
  }
}

class RatingStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                RatingBar.builder(
                  initialRating: rated.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    rated = rating.toInt();
                    print(rated);
                  },
                )
              ],
            )));
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 10, top: 15),
      child: Center(
          // padding: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
          //   alignment: Alignment.centerLeft,
          child: Column(
        children: [
          // Text('Cùng nhau chia sẻ trải nghiệm đặt sân tại đây với mọi người nhé',
          //   style: TextStyle(fontSize: 10.0),
          //   textAlign: TextAlign.left,
          //
          //   ),
          // Text('Tối đa 100 ký tự',
          //   style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),
          //   textAlign: TextAlign.right,
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: TextField(
              controller: feedbackEdt,
              decoration: InputDecoration(
                hintText:
                    'Cùng nhau chia sẻ trải nghiệm đặt sân tại đây với mọi người nhé',
                hintStyle: TextStyle(
                  color: Colors.grey, // <-- Change this
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
              maxLength: 500,
            ),
          )
        ],
      )),
    );
  }
}
