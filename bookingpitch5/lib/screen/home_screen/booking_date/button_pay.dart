import 'package:bookingpitch5/screen/home_screen/booking_date/main_screen.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/detail_pitch.dart';
import 'package:flutter/material.dart';

class ButtonPay extends StatelessWidget {
  final ParamenterToDateBookingScreen pars;
  DateTime dateSelected;
  String timeStartSelected;
  String timeEndSelected;
  ButtonPay(this.pars, this.dateSelected,this.timeStartSelected, this.timeEndSelected);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(
            height: 50.0
        ),
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green
        ),
        child: Center(

            child: Text("Đặt sân",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center)),
      ),
      onTap: (){
        Navigator.of(context).pushNamed('/billPitch',
    arguments: ParameterToBillPitch(pars.pitchModel.name,pars.pitchModel.location,
    pars.detailPitchModel.name,pars.detailPitchModel.typePitch,dateSelected,
    timeStartSelected, timeEndSelected, "100.000 đồng"));
  },
    );

  }
}

class ParameterToBillPitch {
  final String namePitch;
  final String address;
  final String detailPitch;
  final String typeOfPitch;
  final DateTime dateBooking;
  final String timeStartedSeleted;
  final String timeEndSeleted;
  final String price;

  ParameterToBillPitch(this.namePitch, this.address, this.detailPitch,
      this.typeOfPitch, this.dateBooking,this.timeStartedSeleted,this.timeEndSeleted,
      this.price);
}