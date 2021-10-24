
import 'package:bookingpitch5/screen/home_screen/location/image_banner.dart';
import 'package:bookingpitch5/screen/home_screen/location/information_pitch.dart';
import 'package:bookingpitch5/screen/home_screen/location/time_booking.dart';
import 'package:flutter/material.dart';

import 'contact_host.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Khu Liên Hiệp thể thao TNG"),
        backgroundColor: Colors.green,
      ),
      body:
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          ImageBanner("assets/images/location.png",Colors.grey),
          TimeBooking(),
          Container(
            margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
              child: Divider(
                color: Colors.black,
              )
          ),
          Contact(),
          Container(
              margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
              child: Divider(
                color: Colors.black,
              )
          ),
          Information()
        ],

      )
    );
  }
}
