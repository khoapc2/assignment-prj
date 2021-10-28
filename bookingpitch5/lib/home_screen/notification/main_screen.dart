import 'package:bookingpitch5/home_screen/footer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class NotificationPitch extends StatelessWidget {
  const NotificationPitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: const Text("Thông báo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: [
              BookedPitch(),
              // Text("Lịch sử đặt sân")
            ],
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: FooterMenuHost(2),
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
          BookedItem("Lionel Messi", "", "", "assets/images/as.png", "Khu liên hiệp thể thao TNG", "6:00-7:00","07-01-2021","A","5", BookedBottomPart()),
          BookedItem("Lord Bendtner", "", "", "assets/images/lordbendtner.png", "Sân bóng đá Hiệp Phú", "15:00-17:00","07-10-2021","C","7", BookedBottomPart())
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
        const Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Container(
          child: Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: const Text("Cấp nhận", style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.green,
                textColor: Colors.white,
              )
              ,
              FlatButton(
                onPressed: () {},
                child: const Text("Từ chối", style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ],
          ),
        )


      ],
    );
  }
}

class BookedItem extends StatefulWidget {
  var type, time, date, img, name, address, datebooking, namedetailPitch, typePitch,botton;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address, this.datebooking,this.namedetailPitch, this.typePitch, this.botton,  {Key? key}) : super(key: key);

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
    onTap:() => Navigator.of(context).pushNamed('/detailPitch'),
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
                      Row(
                          children: [
                            Text("Tên sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                    Text(widget.name),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.namedetailPitch),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Thể loại sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.typePitch),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Giờ: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.address),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Ngày đặt sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                    Text(widget.datebooking),
                          ]
                      ),

                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Tiền mặt: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            const Text("800,000đ"),
                          ]
                      )
                      ,
                    ],
                  ),
                ),
              ],
            ))),
            const Divider(color: Colors.black),
            widget.botton
          ],
        ),
      );
  }
}

// class BookedBottomPart extends StatelessWidget {
//   const BookedBottomPart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text("Đã đặt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//         FlatButton(
//           onPressed: () {},
//           child: const Text("Hủy", style: TextStyle(fontWeight: FontWeight.bold)),
//           color: Colors.red,
//           textColor: Colors.white,
//         )
//       ],
//     );
//   }
// }

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