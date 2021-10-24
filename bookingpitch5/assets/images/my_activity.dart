import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MyActivity extends StatelessWidget {
  const MyActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Hoạt động của tôi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("Sân đã đặt", style: TextStyle(fontSize: 16))),
                Tab(child: Text("Lịch sử đặt sân", style: TextStyle(fontSize: 16)))
              ],
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          body: const TabBarView(
            children: [
              BookedPitch(),
              BookingHistory()
              // Text("Lịch sử đặt sân")
            ],
          ),
          backgroundColor: Colors.grey[200],
        ));
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
          BookedItem("Sân 5", "13:00", "10/12/2021", "assets/images/img1.jpg", "Khu Liên Hiệp Thể Thao TNG", "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.", BookedBottomPart()),
          BookedItem("Sân 7", "16:00", "12/12/2021", "assets/images/img2.jpg", "Sân bóng Hoàng Phú", "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.", BookedBottomPart())
        ],
      ),
    );
  }
}

class BookedItem extends StatefulWidget {
  var type, time, date, img, name, address, bottomPart;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address, this.bottomPart, {Key? key}) : super(key: key);

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
          ),
          const Divider(color: Colors.black),
          widget.bottomPart
        ],
      ),
    );
  }
}

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookedItem("Sân 5", "", "10/10/2021", "assets/images/img1.jpg", "Khu Liên Hiệp Thể Thao TNG", "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.", CancelBottomPart()),
          BookedItem("Sân 7", "", "10/11/2021", "assets/images/img2.jpg", "Sân bóng Hoàng Phú", "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.", CompleteBottomPart())
        ],
      ),
    );
  }
}

class BookedBottomPart extends StatelessWidget {
  const BookedBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Đã đặt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        FlatButton(
          onPressed: () {},
          child: const Text("Hủy", style: TextStyle(fontWeight: FontWeight.bold)),
          color: Colors.red,
          textColor: Colors.white,
        )
      ],
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
              onPressed: () {  },
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