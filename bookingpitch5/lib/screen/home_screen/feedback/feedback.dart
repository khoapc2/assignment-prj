import 'package:flutter/material.dart';



class ViewFeedback extends StatelessWidget {
  const ViewFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ListFeedBack()
      ]),
      backgroundColor: Colors.green[50],
    );
  }
}

class ImageBanner extends StatelessWidget{
  final String imagePath;
  final Color _color;
  ImageBanner(this.imagePath, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: _color
    ),
      child: Image.asset(imagePath,
      fit: BoxFit.fill),
    );
  }
}

class ListFeedBack extends StatefulWidget {
  ListFeedBack({Key? key}) : super(key: key);

  @override
  _ListFeedBackState createState() => _ListFeedBackState();
}

class _ListFeedBackState extends State<ListFeedBack> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        RatingAndFeedback(),
        FeedbackItem("Khoa Wjpu", 5, "13:00 19/10/2021", "kimochiiii"),
        FeedbackItem("An", 5, "7:00 18/10/2021", "yamate"),
        FeedbackItem("Long", 5, "16:00 17/10/2021", "ahihi"),
        FeedbackItem("KhoaPC", 5, "18:00 16/10/2021",
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
      ],
    ));
  }
}

class RatingAndFeedback extends StatelessWidget {
  const RatingAndFeedback({Key? key}) : super(key: key);

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
            Text("5,0", style: TextStyle(fontSize: 50)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getAllStars(5)),
            Text("có 3.999 bình luận")
          ],
        ),
      ]),
    );
  }
}

class FeedbackItem extends StatefulWidget {
  var name, rating, date, content;
  FeedbackItem(this.name, this.rating, this.date, this.content, {Key? key})
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
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 7),
            Row(
              children: [
                Row(
                    children: getAllStars(widget.rating)),
                SizedBox(width: 10),
                Text(widget.date)
              ],
            ),
            SizedBox(height: 7),
            Text(widget.content, maxLines: 6)
          ],
        ));
  }
}

List<Widget> getAllStars(int rate) {
  List<Icon> stars = getStars(rate);
  List<Icon> nonStars = getNonStar(rate);
  List<Widget> allStars = new List.from(stars)..addAll(nonStars);
  return allStars;
}

List<Icon> getNonStar(int rate) {
  return  List<Icon>.generate(rate, (i) => Icon(Icons.star,
      color: Colors.yellow));
}

List<Icon> getStars(int rate) {
   return  List<Icon>.generate(5-rate, (i) => Icon(Icons.star_border,
        color: Colors.yellow));
}
