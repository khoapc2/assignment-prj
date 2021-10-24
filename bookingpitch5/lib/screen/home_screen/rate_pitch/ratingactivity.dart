import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
            Row(children: [
              Text('Đánh Giá Sân Bóng',style: TextStyle(color: Colors.black.withOpacity(1)))],
            ),
        backgroundColor: Colors.green,
      ),
      body:
      Column(
          children: [
            Image(
                image: AssetImage('../../assets/images/footballpitch1.jpg'),
                width: 500,
                height: 150,
                fit:BoxFit.fill
            ),
            RatingStar(),
            Comment(),
          ],
      ),
        bottomNavigationBar:
        Container(
          margin: EdgeInsets.all(25),
          child: FlatButton(
            child: Text('Gửi', style: TextStyle(fontSize: 20.0),),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {},
            padding: EdgeInsets.all(15),
          ),
        )
    );
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
            Text('Khu Liên Hiệp Thể Thao TNG', style: TextStyle(fontWeight: FontWeight.bold)),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
              },)
          ],
        )
      )
      );
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
                decoration: InputDecoration(
                  hintText: 'Cùng nhau chia sẻ trải nghiệm đặt sân tại đây với mọi người nhé',
                  hintStyle: TextStyle(
                    color: Colors.grey, // <-- Change this
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
                maxLines: 10,
                maxLength: 500,
              ),
            )

            ],
          )
        ),
    );

  }

  }






