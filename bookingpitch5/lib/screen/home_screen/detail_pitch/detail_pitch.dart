import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitch.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/rate_pitch.dart';
import 'package:flutter/material.dart';

class DetailPitch extends StatelessWidget {
  final int id;
  final String name;
  final String imgPath;
  final String typePitch;
  final int normalDayPrice;
  final int specialDayPrice;
  // final DetailTypePitchModel detailTypePitchModel;
  // final int _rates;
  // final PitchModel pitchModel;

  DetailPitch(this.id, this.name, this.imgPath, this.typePitch, this.normalDayPrice,
       this.specialDayPrice);//, this.detailTypePitchModel, this.pitchModel, this._rates);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.fromLTRB(10.0, 0, 0.0, 0),
      constraints: BoxConstraints.expand(width: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 150, width: 300),
            child: Image.asset("assets/images/img1.jpg", fit: BoxFit.fill),
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            child: Row(
              children: [
                Text("Ngày thường: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(normalDayPrice.toString())
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text("Ngày cuối tuần: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(specialDayPrice.toString())
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/dateBooking',arguments: id);
                  // arguments: ParamenterToDateBookingScreen(
                  //     pitchModel, detailTypePitchModel));
            },
            child: Container(
              constraints: BoxConstraints.expand(height: 50.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  border: Border.all(color: Colors.green, width: 5.0)),
              child: Center(
                  child: Text("Đặt sân",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }
}

class ParamenterToDateBookingScreen {
  final PitchModel pitchModel;
  final DetailTypePitchModel detailPitchModel;
  ParamenterToDateBookingScreen(this.pitchModel, this.detailPitchModel);
}
