
import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitchs/pitch_model.dart';
import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/detail_pitches.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/rate_pitch.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/title_pitches.dart';
import 'package:bookingpitch5/screen/home_screen/list_pitch/my_activity.dart';
import 'package:bookingpitch5/view_models/pitch_view_model.dart';
import 'package:bookingpitch5/view_models/sub_pitch_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageBanner.dart';
String namePitch = "Chua co";
double rate = 0.0;
List<SubPitchModel> listSubPitch = [];
class MainScreenDetailPitch extends StatefulWidget{
  final int id;

  MainScreenDetailPitch(this.id) ;

  @override
  _MainScreenDetailPitchState createState() => _MainScreenDetailPitchState();
}

class _MainScreenDetailPitchState extends State<MainScreenDetailPitch> {
  List<SubPitchModel> listSubPitch = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTitle();
  }
  @override
  Widget build(BuildContext context) {
    print("2");
    var listSubPitch = SubPitchViewModel.getListSubPitchByPitchId(widget.id);
    //double rateOfPitch = 3;
    //PitchViewModel.getListPitchByName(listSubPitch[0].pitch_name).then((value) =>  rateOfPitch = value[0].rates);

       return Scaffold(
       appBar: AppBar(
         leading:GestureDetector(
           onTap: (){
             Navigator.pop(context);
           },
           child: Icon(Icons.arrow_back)
         ) ,
         title: Text("Chi tiết sân banh"),
         backgroundColor: Colors.green,
       ),
         body: ListView(
           scrollDirection: Axis.vertical,
           children: [
             ImageBanner("assets/images/DetailPitch.png", Colors.grey),
             TitlePitch(10.0, 10.0, namePitch,30.0),
             RatePitch(10.0, 10.0, rate, widget.id),

             TitlePitch(10.0, 10.0, "Các loại sân",20.0),
             showDetailPitch(listSubPitch)
           ],
         )

               //RatePitch(10.0,10.0,pitchModel.rates);
           );
     }

  Widget showDetailPitch (Future<List<SubPitchModel>> listSubPitch){
    return SingleChildScrollView(
        child: FutureBuilder<List<SubPitchModel>>(
            future: listSubPitch,
            builder: (BuildContext context,
                AsyncSnapshot<List<SubPitchModel>> snapshot) {
              List<Widget> children = [];
              if (snapshot.hasData) {
                List<SubPitchModel> listSubPitch5 = [];
                List<SubPitchModel> listSubPitch7 = [];
                List<SubPitchModel> listSubPitch11 = [];
                List<SubPitchModel> listSubPitchFutsal = [];
                for(var SubPitchModel in snapshot.data!){
                  if(SubPitchModel.typeOfPitch == "Sân 5"){
                    listSubPitch5.add(SubPitchModel);
                  }
                  if(SubPitchModel.typeOfPitch == "Sân 7"){
                    listSubPitch7.add(SubPitchModel);
                  }
                  if(SubPitchModel.typeOfPitch == "Sân 11"){
                    listSubPitch11.add(SubPitchModel);
                  }
                  if(SubPitchModel.typeOfPitch == "Sân futsal"){
                    listSubPitchFutsal.add(SubPitchModel);
                  }
                }
                if(listSubPitch5.length != 0){
                  children.add(TitlePitch(10.0, 10.0, "Sân 5("+listSubPitch5.length.toString()+")",15.0));
                  children.add(SizedBox(
                    height: 300,
                    child: DetailPitches(listSubPitch5),
                  ));

                  if(listSubPitch7.length != 0){
                    // var listTypePitch = listDetailPitchByType(pitchModel, "Sân 7");
                    children.add(TitlePitch(10.0, 10.0, "Sân 7("+listSubPitch7.length.toString()+")",15.0));
                    children.add(SizedBox(
                      height: 300,
                      child: DetailPitches(listSubPitch7),
                    ));
                  }
                  if(listSubPitch11.length != 0){
                    // var listTypePitch = listDetailPitchByType(pitchModel, "Sân 11");
                    children.add(TitlePitch(10.0, 10.0, "Sân 11("+listSubPitch11.length.toString()+")",15.0));
                    children.add(SizedBox(
                      height: 300,
                      child: DetailPitches(listSubPitch11),
                    ));
                  }
                  if(listSubPitchFutsal.length != 0){
                    // var listTypePitch = listDetailPitchByType(pitchModel, "Sân fusan");
                    children.add(TitlePitch(10.0, 10.0, "Sân fusan("+listSubPitchFutsal.length.toString()+")",15.0));
                    children.add(SizedBox(
                      height: 300,
                      child: DetailPitches(listSubPitchFutsal),
                    ));
                  }
                }else if (snapshot.hasError) {
                  children = <Widget>[
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
                  children = const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ];
                }

              }
              return Column(children:children);
            }));
  }

  getTitle() async{

      await PitchViewModel.getPitchById(widget.id).then((value)  {
      setState(() {
        namePitch = value.name;
        rate = value.rates;
        print(namePitch);
      });

      });
  }
}

  // List<DetailTypePitchModel> listDetailPitchByType(PitchModel pitchModel, String typePith){
  //   List<DetailTypePitchModel> list = [];
  //
  //   for(int i = 0; i < pitchModel.listDetailTypePitch.length; i++){
  //     if(pitchModel.listDetailTypePitch[i].typePitch == typePith){
  //       list.add(pitchModel.listDetailTypePitch[i]);
  //     }
  //   }
  //   return list;
  // }



    // List<Widget> list= [];
    //
    // List<SubPitchModel> listSubPitch5 = [];
    // List<SubPitchModel> listSubPitch7 = [];
    // List<SubPitchModel> listSubPitch11 = [];
    // List<SubPitchModel> listSubPitchFutsal = [];
    //
    // for(var SubPitchModel in listSubPitch) {
    //   if(SubPitchModel.typeOfPitch == "Sân 5"){
    //     listSubPitch5.add(SubPitchModel);
    //   }
    //   if(SubPitchModel.typeOfPitch == "Sân 7"){
    //     listSubPitch7.add(SubPitchModel);
    //   }
    //   if(SubPitchModel.typeOfPitch == "Sân 11"){
    //     listSubPitch11.add(SubPitchModel);
    //   }
    //   if(SubPitchModel.typeOfPitch == "Sân futsal"){
    //     listSubPitchFutsal.add(SubPitchModel);
    //   }
    //
    // }
    // if(listSubPitch5.length != 0){
    //   list.add(TitlePitch(10.0, 10.0, "Sân 5("+listSubPitch5.length.toString()+")",15.0));
    //   list.add(SizedBox(
    //     height: 300,
    //     child: DetailPitches(listSubPitch5),
    //   ));
    // }
    // if(listSubPitch7.length != 0){
    //   // var listTypePitch = listDetailPitchByType(pitchModel, "Sân 7");
    //   list.add(TitlePitch(10.0, 10.0, "Sân 7("+listSubPitch7.length.toString()+")",15.0));
    //   list.add(SizedBox(
    //     height: 300,
    //     child: DetailPitches(listSubPitch7),
    //   ));
    // }
    // if(listSubPitch11.length != 0){
    //   // var listTypePitch = listDetailPitchByType(pitchModel, "Sân 11");
    //   list.add(TitlePitch(10.0, 10.0, "Sân 11("+listSubPitch11.length.toString()+")",15.0));
    //   list.add(SizedBox(
    //     height: 300,
    //     child: DetailPitches(listSubPitch11),
    //   ));
    // }
    // if(listSubPitchFutsal.length != 0){
    //   // var listTypePitch = listDetailPitchByType(pitchModel, "Sân fusan");
    //   list.add(TitlePitch(10.0, 10.0, "Sân fusan("+listSubPitchFutsal.length.toString()+")",15.0));
    //   list.add(SizedBox(
    //     height: 300,
    //     child: DetailPitches(listSubPitchFutsal),
    //   ));
    // }
    // return list.map((e) => e);

