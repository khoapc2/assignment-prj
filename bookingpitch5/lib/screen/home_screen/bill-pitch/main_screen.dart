import 'package:bookingpitch5/screen/home_screen/bill-pitch/button_pay.dart';
import 'package:bookingpitch5/screen/home_screen/bill-pitch/information_pitch.dart';
import 'package:bookingpitch5/screen/home_screen/bill-pitch/title_pitches.dart';
import 'package:bookingpitch5/screen/home_screen/booking_date/button_pay.dart';

import 'package:flutter/material.dart';

import 'ImageBanner.dart';

class BillPitch extends StatelessWidget{
  ParameterToBillPitch pars;

  BillPitch(this.pars);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Thông tin đặt sân"),
          backgroundColor: Colors.green,
        ),
    body: ListView(
        scrollDirection: Axis.vertical,
        children: [

        ImageBanner(),
          TitlePitch(),
        InformationPitch(pars.namePitch, pars.address, pars.detailPitch, pars.typeOfPitch, pars.dateBooking,
            pars.timeStartedSeleted, pars.timeEndSeleted, pars.price)
        ]
    ),
        bottomNavigationBar: DoneButton(),
      );
  }
}