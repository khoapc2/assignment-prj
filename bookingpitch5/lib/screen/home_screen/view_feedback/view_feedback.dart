import 'package:bookingpitch5/models/feedbacks/feedback_model.dart';
import 'package:bookingpitch5/models/tranfer_params/pitchId_and_rate.dart';
import 'package:bookingpitch5/screen/home_screen/login/widgets/login_form.dart';
import 'package:bookingpitch5/screen/home_screen/rate_and_feedback_pitch/ratingactivity.dart';
import 'package:bookingpitch5/view_models/feedback_view_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewFeedback extends StatelessWidget {
  PitchID_Rate pitchID_Rate;
  ViewFeedback(this.pitchID_Rate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: Text("Bình luận"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(children: [
        ImageBanner("assets/images/DetailPitch.png", Colors.grey),
        ListFeedBack(id: pitchID_Rate.pitchId, rate: pitchID_Rate.rate)
      ]),
      backgroundColor: Colors.green[50],
    );
  }
}

class ImageBanner extends StatelessWidget {
  final String imagePath;
  final Color _color;
  ImageBanner(this.imagePath, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: _color),
      child: Image.asset(imagePath, fit: BoxFit.fill),
    );
  }
}

class ListFeedBack extends StatefulWidget {
  ListFeedBack({Key? key, this.id, this.rate}) : super(key: key);
  @override
  _ListFeedBackState createState() => _ListFeedBackState(id, rate);
  final int? id;
  final double? rate;
}

class _ListFeedBackState extends State<ListFeedBack> {

  late Future<List<FeedbackResponse>> listFeedback;
  _ListFeedBackState(this.id, this.rate);
  final int? id;
  final double? rate;

  @override
  void initState() {
    super.initState();
    listFeedback = FeedbackViewModel.getFeedback(id!);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<List<FeedbackResponse>>(
          future: listFeedback,
          builder: (BuildContext context,
              AsyncSnapshot<List<FeedbackResponse>> snapshot) {
            List<Widget> children = [];
            FeedbackResponse data;
            if (snapshot.hasData) {
              children.add(RatingAndFeedback(snapshot.data!.length, rate));
              for (int i = 0; i < snapshot.data!.length; i++) {
                data = snapshot.data!.elementAt(i);                
                children.add(FeedbackItem(data.customerName, data.rating, data.content));
              }
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    child: new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 15.0,
                      animationDuration: 5000,
                      percent: 0.8,
                      center: Text("Loading..."),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.green,
                    ),                 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Chờ chút người anh em...'),
                )
              ];
            }
            return Column(children: children);
          }),
        );
  }
}

class RatingAndFeedback extends StatelessWidget {
  int numOfFeed;
  double? rate;
  RatingAndFeedback(this.numOfFeed, this.rate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      width: 370,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(children: [
        SizedBox(
          height: 30,
          child: Text("Nhận xét và đánh giá",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Column(
          children: [           
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rate.toString(), style: TextStyle(fontSize: 50)),
                  Icon(Icons.star, size: 50, color: Colors.yellow[800],)
                ]),
            Text('Có ' + numOfFeed.toString() +' bình luận')
          ],
        ),
      ]),
    );
  }
}

class FeedbackItem extends StatefulWidget {
  var name, rating, content;
  FeedbackItem(this.name, this.rating, this.content, {Key? key})
      : super(key: key);

  @override
  _FeedbackItemState createState() => _FeedbackItemState();
}

class _FeedbackItemState extends State<FeedbackItem> {
  @override
  Widget build(BuildContext context) {
    return Container( 
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 370,
        height: 150,
        
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(25),
            
        ),    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 7),
            Row(
              children: [
                Row(children: getAllStars(widget.rating)),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 7),
            Text(widget.content, maxLines: 6, style: TextStyle(fontSize: 15),)
          ],
        ));
  }
}

List<Widget> getAllStars(int rate) {
  List<Icon> stars = getStars(rate);
  List<Icon> nonStars = getNonStar(rate);
  List<Widget> allStars = new List.from(nonStars)..addAll(stars);
  return allStars;
}

List<Icon> getNonStar(int rate) {
  return List<Icon>.generate(
      rate, (i) => Icon(Icons.star, color: Colors.yellow[800]));
}

List<Icon> getStars(int rate) {
  return List<Icon>.generate(
      5 - rate, (i) => Icon(Icons.star_border, color: Colors.yellow[800]));
}
