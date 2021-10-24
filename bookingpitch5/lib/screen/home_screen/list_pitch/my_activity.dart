import 'package:bookingpitch5/screen/home_screen/footer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ListPitch extends StatelessWidget {
  const ListPitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Các sân 5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.green,
            ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              BookedPitch(),
              // Text("Lịch sử đặt sân")
            ],
          ),
        );
  }
}

class BookedPitch extends StatefulWidget {
  const BookedPitch({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookedPitchState();
}

class _BookedPitchState extends State<BookedPitch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookedItem("Sân A,B,C", "0:00", "23:00", "assets/images/img1.jpg", "Khu Liên Hiệp Thể Thao TNG", "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh."),
          BookedItem("Sân A,B,E", "6:00", "24:00", "assets/images/img2.jpg", "Sân bóng Đình Long", "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh."),
          BookedItem("Sân A", "6:00", "24:00", "assets/images/sanbanh5.jpg", "Sân bóng Phúc An", "900 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh."),
          BookedItem("Sân A,B", "6:00", "24:00", "assets/images/sanbanh6.jpg", "Sân bóng Phú Nhuận", "200 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh."),
          BookedItem("Sân C", "6:00", "24:00", "assets/images/sanbanh8.jpg", "Sân bóng Nhà Văn Hóa", "400 Lý Thường Kiệt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh."),
          BookedItem("Sân B", "6:00", "24:00", "assets/images/sanbanh9.jpg", "Sân bóng Phú Cường", "89 Chi Lăng, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.")
        ],
      ),
    );
  }
}

class BookedItem extends StatefulWidget {
  var type, time, date, img, name, address;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address, {Key? key}) : super(key: key);

  @override
  State<BookedItem> createState() => _BookedItemState();
}

class _BookedItemState extends State<BookedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
        margin: const EdgeInsets.only(top: 15),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(widget.type, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.time, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 20),
                    Text(widget.date, style: const TextStyle(color: Colors.grey))
                  ]
              )
            ]
        ),

    GestureDetector(
    onTap:() => Navigator.of(context).pushNamed('/checkLocation'),
    child:
    Container(
    child:
            Row(
              children: [
                Image(
                  image: AssetImage(widget.img),
                  width: 100,
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 255,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(widget.address, maxLines: 3),
                      const SizedBox(height: 10),
                      const Text("800,000đ - Tiền mặt"),
                    ],
                  ),
                ),
              ],
            ))),
            const Divider(color: Colors.black),
          ],
        ),
      );
  }
}


class CompleteBottomPart extends StatelessWidget {
  const CompleteBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/complete.png"),
          // width: 100,
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/ratePitch');
              },
              child: const Text("Đánh giá", style: TextStyle(fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.green, width: 2)
              )
            ),
            const SizedBox(width: 20),
            FlatButton(
              onPressed: () {},
              child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class CancelBottomPart extends StatelessWidget {
  const CancelBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/cancel.png"),
          // width: 100,
          height: 50,
        ),
        FlatButton(
          onPressed: () {},
          child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
          color: Colors.green,
          textColor: Colors.white,
        )
      ],
    );
  }
}