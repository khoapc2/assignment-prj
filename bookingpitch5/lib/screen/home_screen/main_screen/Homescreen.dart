

import 'package:bookingpitch5/api/pitch_get_service.dart';
import 'package:bookingpitch5/models/pitchs/pitch_model.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/pitches.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/type_pitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../footer_menu.dart';
import 'image_banner.dart';
import 'my_location.dart';
import 'search_value.dart';
import 'my_voucher.dart';
import 'title_pitches.dart';

class Homescreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<Homescreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //PitchesModel nearestPitchesModel = PitchesModel.fetchNearestPitch();
    var highestRatePitchModel = PitchServce().getListHightRatePitches();
    var recomandPitchModel = PitchServce().getRecommandPitches();
    //PitchesModel hotDealPitchesModel = PitchesModel.fetchHotDeal();
    // TODO: implement build
    return Scaffold(
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        scrollDirection: Axis.vertical,
        children: [
          ImageBanner("assets/images/Title.png", Colors.green),
          MyLocation("603/17 Phạm Văn Chiêu", Colors.green),
          SearchValue(20.0, 20.0),
          TypePitch(
              15.0,
              20.0,
              "assets/images/san5.png",
              "assets/images/san7.png",
              "assets/images/san11.png",
              "assets/images/sanfusan.png"),
          MyVoucher(20.0, 20.0),
          // TitlePitch(20.0, 20.0, "Sân bóng gần đây"),
          // SizedBox(
          //   height: 230.0,
          //   child: Pitches(nearestPitchesModel),
          // ),
          TitlePitch(20.0, 20.0, "Sân được đánh giá cao"),
          SingleChildScrollView(
            child: FutureBuilder<List<PitchModel>>(
                future: highestRatePitchModel,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PitchModel>> snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    children.add(
                      SizedBox(
                        height: 230.0,
                        child: Pitches(snapshot.data!),
                      )
                    );
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
                  return Column(children:children);
                }
            ),
          ),
          TitlePitch(20.0, 20.0, "Sân bóng gợi ý cho bạn"),
          SingleChildScrollView(
            child: FutureBuilder<List<PitchModel>>(
                future: recomandPitchModel,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PitchModel>> snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    children.add(
                        SizedBox(
                          height: 230.0,
                          child: Pitches(snapshot.data!),
                        )
                    );
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
                  return Column(children:children);
                }
            ),
          )
          // TitlePitch(20.0, 20.0, "Sân đang được giảm giá"),
          // SizedBox(
          //   height: 300.0,
          //   child: HotDealPitches(hotDealPitchesModel),
          // ),
        ],
      ),
      bottomNavigationBar: FooterMenu(0),
    );
  }
}
