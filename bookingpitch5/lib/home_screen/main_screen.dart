import 'package:bookingpitch5/home_screen/footer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'ImageBanner.dart';
import 'button_pay.dart';

class CalendarTodayHost extends StatelessWidget {
  const CalendarTodayHost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: const Text("Màn hình chính chủ sân", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: [
              ImageBanner("assets/images/baneradmin.jpg", Colors.grey),
              BookedPitch(),
              ButtonPay()
              // Text("Lịch sử đặt sân")
            ],
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: FooterMenuHost(0),
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
          BookedItem("Khu Liên Hiệp Thể Thao TNG", "", "", "assets/images/img1.jpg", "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.", "6:00-23:00",BookedBottomPart() ),
          BookedItem("Sân bóng Hoàng Phú", "", "", "assets/images/img2.jpg", "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.", "6:00-23:00", BookedBottomPart())
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
        const Text("Sửa đổi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Container(
          child: Row(
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/updateModerPitch');
                },
                child: const Text("Cập nhật", style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.green,
                textColor: Colors.white,
              )
              ,
              FlatButton(
                onPressed: () {},
                child: const Text("Xóa", style: TextStyle(fontWeight: FontWeight.bold)),
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
  var type, time, date, img, name, address, botton;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address,this.botton,  {Key? key}) : super(key: key);

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
    onTap:() => Navigator.of(context).pushNamed('/detailPitchHost'),
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
                      Text(widget.name, maxLines: 3,),

                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Thời gian hoạt động: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.address, maxLines: 3),
                          ]
                      ),


                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Số điện thoại: ", 
                              style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("01234567"),
                        ]
                      )

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