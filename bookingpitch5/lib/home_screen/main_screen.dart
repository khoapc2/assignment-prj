import 'package:bookingpitch5/home_screen/footer_menu.dart';
import 'package:bookingpitch5/models/mother_pitch_model.dart';
import 'package:bookingpitch5/view_models/create_pitch_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
              ButtonPay(),
              BookedPitch(),
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
  late Future<List<GetPitchModel>> listPitch;
  @override
  initState() {
    super.initState();
    listPitch = PitchViewModel.getListPitchByOwnerID();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         BookedItem("Khu Liên Hiệp Thể Thao TNG", "", "", "assets/images/img1.jpg", "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.", "6:00-23:00",BookedBottomPart() ),
  //         BookedItem("Sân bóng Hoàng Phú", "", "", "assets/images/img2.jpg", "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.", "6:00-23:00", BookedBottomPart())
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<GetPitchModel>>(
          future: listPitch,
          builder: (BuildContext context,
              AsyncSnapshot<List<GetPitchModel>> snapshot) {
            List<Widget> children = [];
            GetPitchModel data;
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.length; i++) {
                data = snapshot.data!.elementAt(i);
                children.add(Pitches(
                    data.idPitch,
                    data.name,
                    data.location,
                    // data.img_path
                    "assets/images/img2.jpg",
                    data.phone,
                    PitchViewModel.tranferTimeFormat(data.time_start),
                    PitchViewModel.tranferTimeFormat(data.time_end),
                    BookedBottomPart(data.idPitch)));
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
              children = const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Chờ chút xíu nhé tình yêu <3...'),
                )
              ];
            }
            return Column(children: children);
          }),
    );
  }
}

class Pitches extends StatefulWidget {
  var idPitch, name, location, img_path, phone, time_start, time_end, botton;

  Pitches(this.idPitch, this.name, this.location, this.img_path, this.phone,
      this.time_start, this.time_end, this.botton,
      {Key? key})
      : super(key: key);

  @override
  State<Pitches> createState() => _BookedItemState();
}


class BookedBottomPart extends StatelessWidget {
  BookedBottomPart(this.pitchID, {Key? key}) : super(key: key);
  var pitchID;
  var isDelete;

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
                  Navigator.of(context).pushNamed('/updateMotherPitch', arguments: 1);
                },
                child: const Text("Cập nhật", style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.green,
                textColor: Colors.white,
              )
              ,
              FlatButton(
                onPressed: () {
                  isDelete = PitchViewModel.deletePitch(pitchID);
                  if(isDelete) {
                    Fluttertoast.showToast(
                        msg: "Delete Pitch Successful",
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white);
                  }else{
                    Fluttertoast.showToast(
                        msg: "Delete Pitch Fail",
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white);
                  }
                },
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

// class BookedItem extends StatefulWidget {
//   var type, time, date, img, name, address, botton;
//   BookedItem(this.type, this.time, this.date, this.img, this.name, this.address,this.botton,  {Key? key}) : super(key: key);
//
//   @override
//   State<BookedItem> createState() => _BookedItemState();
// }

class _BookedItemState extends State<Pitches> {
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
                Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(widget.time_start + "-" + widget.time_end, style: const TextStyle(color: Colors.grey)),
              //       const SizedBox(width: 20),
              //       Text(widget.time_start, style: const TextStyle(color: Colors.grey))
              //     ]
              // )
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
                  image: AssetImage(widget.img_path),
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
                      Text(widget.location, maxLines: 3,),

                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Thời gian hoạt động: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.time_start + " - " + widget.time_end, maxLines: 3),
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
                          Text(widget.phone),
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

// class CompleteBottomPart extends StatelessWidget {
//   const CompleteBottomPart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Image(
//           image: AssetImage("assets/images/complete.png"),
//           // width: 100,
//           height: 50,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             OutlinedButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/ratePitch');
//               },
//               child: const Text("Đánh giá", style: TextStyle(fontWeight: FontWeight.bold)),
//               style: OutlinedButton.styleFrom(
//                 primary: Colors.green,
//                 backgroundColor: Colors.white,
//                 side: const BorderSide(color: Colors.green, width: 2)
//               )
//             ),
//             const SizedBox(width: 20),
//             FlatButton(
//               onPressed: () {},
//               child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
//               color: Colors.green,
//               textColor: Colors.white,
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
//
// class CancelBottomPart extends StatelessWidget {
//   const CancelBottomPart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Image(
//           image: AssetImage("assets/images/cancel.png"),
//           // width: 100,
//           height: 50,
//         ),
//         FlatButton(
//           onPressed: () {},
//           child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
//           color: Colors.green,
//           textColor: Colors.white,
//         )
//       ],
//     );
//   }
// }