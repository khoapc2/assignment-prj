import 'package:flutter/cupertino.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/rate_pitch.dart';
import 'package:flutter/material.dart';

class Pitch extends StatelessWidget{
  final int _id;
  final String _imagePath;
  final String _name;
  final String _location;
  final String _timeStart;
  final String _timeEnd;
  final String _phone;
  final double _rate;

  Pitch(this._id,this._imagePath, this._name,
      this._location,
      this._timeStart,
      this._timeEnd,
      this._phone,
      this._rate);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/second',
          arguments: _id);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200]
          ),
          margin: EdgeInsets.fromLTRB(
              20.0,0,0.0,0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Image.asset(_imagePath != null ? _imagePath:"assets/images/img1.jpg",height: 100.0,width: 230, fit: BoxFit.fill),
              Text(_name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              //ListTile(
              //  leading: Icon(Icons.location_on),
              //   title: Text(_location),
              // ),
              Container(

                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(_location, maxLines: 2,),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.alarm),
                    Text(_timeStart+"-"+_timeEnd)
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    Text(_phone)
                  ],
                ),
              ),
          RatePitch(_rate)
            ],
          ),
        ),
      );
  }
}