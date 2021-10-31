import 'package:bookingpitch5/models/bookings/booking_model.dart';
import 'package:bookingpitch5/screen/home_screen/location/image_banner.dart';
import 'package:bookingpitch5/screen/home_screen/location/time_booking.dart';
import 'package:bookingpitch5/view_models/my_booking_view_model.dart';
import 'package:flutter/material.dart';

import 'contact_host.dart';

class Location extends StatefulWidget {
  var bookingID;
  Location(this.bookingID);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late Future<BookingModel> booking;
  @override
  void initState() {
    super.initState();
    booking = MyBookingViewModel.getBookingByID(widget.bookingID);
  }

  List<Widget> generateDescription(BookingModel booking) {
    List<Widget> content = [];
    content.add(Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text("Tại:   ", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(booking.pitchName)
        ],
      ),
    ));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Địa chỉ:   ", style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            width: 294,
            child: Text(booking.address, maxLines: 4),
          )
        ])));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Tên sân:   ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.subPitchName)
          ],
        )));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Thể loại:   ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.subPitchType)
          ],
        )));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Ngày nhận sân:   ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.dateBooking)
          ],
        )));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Giờ đá:   ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.timeStart + " - " + booking.timeEnd)
          ],
        )));
    content.add(Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text("Giá:   ", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(booking.price + "  VND")
        ],
      ),
    ));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Phương thức thanh toán:   ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Tiền mặt")
          ],
        )));
    content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Ngày đặt:   ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.createDate)
          ],
        )));
    if(booking.status == 'Cancel') {
      content.add(Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text("Lý do hủy:   ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(booking.cancelReason)
          ],
        )));
    }
    return content;
  }

  List<Widget> generateWidget(BookingModel booking) {
    List<Widget> layout = [];
    layout.add(ImageBanner("assets/images/location.png", Colors.grey));
    if(booking.status == 'Booked') {
      layout.add(TimeBooking(booking.timeStart, booking.dateBooking));
    } else if(booking.status == 'Paid') {
      layout.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image(
          image: AssetImage("assets/images/complete.png"),
          // width: 100,
          height: 50,
        )]));
    } else if(booking.status == 'Cancel') {
      layout.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image(
          image: AssetImage("assets/images/cancel.png"),
          // width: 100,
          height: 50,
        )]));
    }
    
    layout.add(Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Divider(color: Colors.black)));
    layout.add(Contact(booking.phone));
    layout.add(Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Divider(color: Colors.black)));
    layout.add(Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: generateDescription(booking))));
    return layout;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Chi tiết"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder<BookingModel>(
            future: booking,
            builder:
                (BuildContext context, AsyncSnapshot<BookingModel> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = generateWidget(snapshot.data!);
              } else if (snapshot.hasError) {
                children = [
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
                children = [
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
                    child: Text('Chờ chút xíu...'),
                  )
                ];
              }
              return Column(children: children);
            }));
  }
}
