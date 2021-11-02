
import 'package:bookingpitch5/home_screen/detail_pitch/title_pitches.dart';

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

class MainScreenDetailPitchHost extends StatefulWidget{
  MainScreenDetailPitchHost(this.pitchID) ;
  var pitchID;

  @override
  State<MainScreenDetailPitchHost> createState() => _MainScreenDetailPitchHostState();
}

class _MainScreenDetailPitchHostState extends State<MainScreenDetailPitchHost> {
  var pitchModel;
  var rates;
  String type5 = "Sân 5";
  String type7 = "Sân 7";
  String type11 = "Sân 11";
  String typeFutsal = "Sân futsal";

  @override
  Widget build(BuildContext context) {
    setState(() {
      getPitchByID();
      getListPitch5();
      getListPitch7();
      getListPitch11();
      getListPitchFutsal();
    });


    //Test
    // var pitchModel= PitchesModel.getPitchById("1");
     // if(listSubPitch.isNotEmpty){
       return Scaffold(
       appBar: AppBar(
         title: Text(txtTitle),
         leading: GestureDetector(
             onTap: () {
               Navigator.pop(context);
             },
             child: Icon(Icons.arrow_back)),
         backgroundColor: Colors.green,
       ),
         body: ListView(
           scrollDirection: Axis.vertical,
           children: [
             ImageBanner("assets/images/sanbanh1.png", Colors.grey),
             TitlePitch(10.0, 10.0, txtTitle,30.0),
             RatePitch(10.0, 10.0, rates, widget.pitchID),
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
      list.add(TitlePitch(10.0, 10.0, "Sân futsal("+listPitchModelFutsal.length.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listPitchModelFutsal),
      ));
    }

    list.add(ButtonPay(widget.pitchID));
    return list.map((e) => e);
  }

  getPitchByID() async {
    await PitchViewModel.getPitchByPitchID(widget.pitchID).then((value) {
        pitchModel = value;
        txtTitle = value.name;
        rates = value.rates;
       }
    );
  }

  getListPitch5() async {
    await SonPitchViewModel.getListPitchByCategory(widget.pitchID, type5).then((value) {
      setState(() {
        listPitchModel5 = value;
      });
    });
  }

  getListPitch7() async {
    await SonPitchViewModel.getListPitchByCategory(widget.pitchID, type7).then((value) {
        listPitchModel7 = value;
    });
  }

  getListPitch11() async {
    await SonPitchViewModel.getListPitchByCategory(widget.pitchID, type11).then((value) {
        listPitchModel11 = value;
    });
  }

  getListPitchFutsal() async {
    await SonPitchViewModel.getListPitchByCategory(widget.pitchID, typeFutsal).then((
        value) {
        listPitchModelFutsal = value;
    });
  }

  getAllSubPitch() async {
    await SonPitchViewModel.getSonPitchModel(widget.pitchID).then((
        value) {
        listSubPitch = value;
    });
  }
}