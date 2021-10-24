import 'package:flutter/cupertino.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/rate_pitch.dart';
import 'package:flutter/material.dart';

class Pitch extends StatelessWidget{
  final String _id;
  final String _imagePath;
  final String _name;
  final String _location;
  final String _time;
  final String _distance;
  final int _rate;

  Pitch(this._id,this._imagePath, this._name,
      this._location,
      this._time,
      this._distance,
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
              Image.asset(_imagePath,height: 100.0),
              Text(_name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              //ListTile(
              //  leading: Icon(Icons.location_on),
              //   title: Text(_location),
              // ),
              Container(

                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(_location),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.alarm),
                    Text(_time)
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.map_rounded),
                    Text(_distance)
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