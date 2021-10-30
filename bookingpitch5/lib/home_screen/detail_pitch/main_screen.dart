
import 'package:bookingpitch5/home_screen/detail_pitch/title_pitches.dart';
import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitch.dart';
import 'package:bookingpitch5/models/pitches.dart';
import 'package:bookingpitch5/models/son_pitchs/son_pitch_model.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/rate_pitch.dart';
import 'package:bookingpitch5/view_models/pitch_view_model.dart';
import 'package:bookingpitch5/view_models/son_pitch_view_model.dart';
import 'package:flutter/material.dart';
import 'ImageBanner.dart';
import 'button_pay.dart';
import 'detail_pitches.dart';

String txtTitle = "";
List<GetSonPitchModel> listSubPitch = List.empty();
List<GetSonPitchModel> listPitchModel5 = List.empty();
List<GetSonPitchModel> listPitchModel7 = List.empty();
List<GetSonPitchModel> listPitchModel11 = List.empty();
List<GetSonPitchModel> listPitchModelFutsal = List.empty();

class MainScreenDetailPitchHost extends StatelessWidget{
  MainScreenDetailPitchHost(this.pitchID) ;
  var pitchID;
  var pitchModel;

  String type5 = "Sân 5";
  String type7 = "Sân 7";
  String type11 = "Sân 11";
  String typeFutsal = "Sân futsal";

  @override
  Widget build(BuildContext context) {
    print(pitchID);
    getPitchByID();
    getListPitch5();
    getListPitch7();
    getListPitch11();
    getListPitchFutsal();

    //Test
    // var pitchModel= PitchesModel.getPitchById("1");
     // if(listSubPitch.isNotEmpty){
       return Scaffold(
       appBar: AppBar(
         title: Text(txtTitle),
         backgroundColor: Colors.green,
       ),
         body: ListView(
           scrollDirection: Axis.vertical,
           children: [
             ImageBanner("assets/images/sanbanh1.png", Colors.grey),
             TitlePitch(10.0, 10.0, txtTitle,30.0),
             RatePitch(10.0, 10.0, 5),
             TitlePitch(10.0, 10.0, "Các loại sân",20.0),
           ]..addAll(showDetailPitch()),
         )
               //RatePitch(10.0,10.0,pitchModel.rates);
           );
     // }
     // return Text("This pitch is not exist");
  }

  Iterable<Widget> showDetailPitch (){
    List<Widget> list= [];
    if(listPitchModel5.isNotEmpty){
      list.add(TitlePitch(10.0, 10.0, "Sân 5(" + listPitchModel5.length.toString() + ")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listPitchModel5),
      ));
    }

    if(listPitchModel7.isNotEmpty){
      list.add(TitlePitch(10.0, 10.0, "Sân 7("+ listPitchModel7.length.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listPitchModel7),
      ));
    }

    if(listPitchModel11.isNotEmpty){
      list.add(TitlePitch(10.0, 10.0, "Sân 11("+listPitchModel11.length.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listPitchModel11),
      ));
    }

    if(listPitchModelFutsal.isNotEmpty){
      list.add(TitlePitch(10.0, 10.0, "Sân fusan("+listPitchModelFutsal.length.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listPitchModelFutsal),
      ));
    }

    list.add(ButtonPay(pitchID));
    return list.map((e) => e);
  }


  getPitchByID() async {
    await PitchViewModel.getPitchByPitchID(pitchID).then((value) {
        pitchModel = value;
        txtTitle = value.name;
       }
    );
  }

  getListPitch5() async {
    await SonPitchViewModel.getListPitchByCategory(pitchID, type5).then((value) {
      listPitchModel5 = value;
      print(listPitchModel5);
    });
  }


  getListPitch7() async {
    await SonPitchViewModel.getListPitchByCategory(pitchID, type7).then((value) {
      listPitchModel7 = value;
    });
  }

  getListPitch11() async {
    await SonPitchViewModel.getListPitchByCategory(pitchID, type11).then((value) {
      listPitchModel11 = value;
    });
  }

  getListPitchFutsal() async {
    await SonPitchViewModel.getListPitchByCategory(pitchID, typeFutsal).then((
        value) {
      listPitchModelFutsal = value;
    });
  }

  //Test
  getAllSubPitch() async {
    await SonPitchViewModel.getSonPitchModel(pitchID).then((
        value) {
      listSubPitch = value;
    });
  }
}