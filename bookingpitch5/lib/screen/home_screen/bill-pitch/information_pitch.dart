import 'package:bookingpitch5/models/bookings/booking_model.dart';
import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';
import 'package:bookingpitch5/view_models/my_booking_view_model.dart';
import 'package:bookingpitch5/view_models/pitch_view_model.dart';
import 'package:bookingpitch5/view_models/sub_pitch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String nameSubPitch = "Chưa có tên";
String nameMotherPitch = "Chưa có tên";
int SubPitchId = 0;
int PitchId = 0;
String adress = "Không có địa chỉ";
String dateBooking = "Chưa có ngày nhận sân";
String timeStart = "Chưa có";
String timeEnd = "Chưa có";
String price = "Chưa có";
String typeOfPitch = "chưa có";

class InformationPitch extends StatefulWidget{
  // final String namePitch;
  // final String address;
  // final String detailPitch;
  // final String typeOfPitch;
  // final DateTime dateBooking;
  // final String timeStartedSeleted;
  // final String timeEndSeleted;
  // final String price;
  final int BookingId;

  // InformationPitch(this.namePitch, this.address, this.detailPitch,
  //     this.typeOfPitch, this.dateBooking,this.timeStartedSeleted,this.timeEndSeleted,
  //     this.price, this.BookingId);
  InformationPitch(this.BookingId);

  @override
  _InformationPitchState createState() => _InformationPitchState();
}

class _InformationPitchState extends State<InformationPitch> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformation();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    // return SingleChildScrollView(
    //     child: Container(
    //     margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
    //     decoration: BoxDecoration(
    //     color: Colors.grey[200],
    //     borderRadius: BorderRadius.circular(25.0)
    //           ),
    //       child:
    //           FutureBuilder<BookingModel>(
    //               future: bookingModel,
    //               builder: (BuildContext context,
    //               AsyncSnapshot<BookingModel> snapshot) {
    //               List<Widget> children = [];
    //               if (snapshot.hasData) {
    //                 SubPitchViewModel.getSubPitchById(snapshot.data!.subPitchID).then(
    //                         (value) => {
    //                           nameSubPitch = value.name,
    //                           SubPitchId = value.id
    //                         });
    //                 var subPitchModel = SubPitchViewModel.getSubPitchById(snapshot.data!.subPitchID);
    //                 children.add(
    //                 FutureBuilder<SubPitchModel>(
    //                   future: subPitchModel,
    //                   builder: (BuildContext context,
    //                     AsyncSnapshot<SubPitchModel> snapshot) {
    //                         List<Widget> childrenSubPitch = [];
    //                         // childrenSubPitch.add(ListTile(
    //                         //   leading: Text("Tên Sân:"),
    //                         //   title: Text(snapshot.data!.pitch_name,
    //                         //     style: TextStyle(fontWeight: FontWeight.bold),),
    //                         //   ));
    //                         childrenSubPitch.add(ListTile(
    //                           leading: Text("Số sân:"),
    //                           title: Text(snapshot.data!.name,
    //                           style: TextStyle(fontWeight: FontWeight.bold),),
    //                         ));
    //                         childrenSubPitch.add( ListTile(
    //                         leading: Text("Thể loại sân:"),
    //                         title: Text(snapshot.data!.typeOfPitch,
    //                         style: TextStyle(fontWeight: FontWeight.bold),),
    // ));
    //                         //var pitchModel = PitchViewModel.
    //                 return Column(children: childrenSubPitch);
    //                   })
    //         );
    //
    //       }else if (snapshot.hasError) {
    //         children = <Widget>[
    //           const Icon(
    //             Icons.error_outline,
    //             color: Colors.red,
    //             size: 60,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(top: 16),
    //             child: Text('Error: ${snapshot.error}'),
    //           )
    //         ];
    //       } else {
    //         children = const <Widget>[
    //           Padding(
    //             padding: EdgeInsets.only(top: 20),
    //             child: SizedBox(
    //               child: CircularProgressIndicator(),
    //               width: 60,
    //               height: 60,
    //             ),),
    //           Padding(
    //             padding: EdgeInsets.only(top: 16),
    //             child: Text('Awaiting result...'),
    //           )
    //         ];
    //       }
    //       return Column(children:children);
    //     })));

    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0)
      ),
      child: Column(
        children: [
          ListTile(
            leading: Text("Tên Sân:"),
            title: Text(nameMotherPitch,
            style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Địa chỉ:"),
            title: Text(adress,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Số sân:"),
            title: Text(nameSubPitch,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Thể loại sân:"),
            title: Text(typeOfPitch,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Ngày nhân sân"),
            title: Text((dateBooking),
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Giờ đá"),
            title: Text(timeStart + "-" + timeEnd,
              style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: Text(price,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Text("Phương thức thanh toán"),
            title: Text("Thanh toán bằng tiền mặt",
              style: TextStyle(fontWeight: FontWeight.bold),),

          ),
        ],
      ),
    );

  }

  getInformation(){
    MyBookingViewModel.getBookingById(widget.BookingId).then(
            (value)  {
              setState(() {
                SubPitchId = value.subPitchID;
                timeStart = value.timeStart;
                timeEnd = value.timeEnd;
                price = value.price;
                dateBooking = value.dateBooking;

                SubPitchViewModel.getSubPitchById(SubPitchId).then((value)  {
                  setState(() {
                    nameSubPitch = value.name;

                    typeOfPitch = value.typeOfPitch;
                    PitchId = value.pitch_id;

                    PitchViewModel.getPitchById(PitchId).then((value)  {
                      setState(() {
                        adress = value.location;
                        nameMotherPitch = value.name;
                        print(nameMotherPitch);
                      });
                    });
                  });

                });
              });

        });

    // SubPitchViewModel.getSubPitchById(SubPitchId).then((value)  {
    //   setState(() {
    //     nameSubPitch = value.name;
    //
    //     typeOfPitch = value.typeOfPitch;
    //     PitchId = value.pitch_id;
    //   });
    //
    // });
    //
    // PitchViewModel.getPitchById(PitchId).then((value)  {
    //   setState(() {
    //     adress = value.location;
    //     nameMotherPitch = value.name;
    //   });
    // });

  }
}