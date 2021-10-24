import 'package:bookingpitch5/models/pitches.dart';
import 'package:bookingpitch5/screen/home_screen/main_screen/hot_deal_pitches.dart';
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

class Homescreen extends StatelessWidget {
  Homescreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PitchesModel nearestPitchesModel = PitchesModel.fetchNearestPitch();
    PitchesModel highestPitchesModel = PitchesModel.fetchHighestRatePitch();
    PitchesModel hotDealPitchesModel = PitchesModel.fetchHotDeal();
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
          TitlePitch(20.0, 20.0, "Sân bóng gần đây"),
          SizedBox(
            height: 230.0,
            child: Pitches(nearestPitchesModel),
          ),
          TitlePitch(20.0, 20.0, "Sân được đánh giá cao"),
          SizedBox(
            height: 230.0,
            child: Pitches(highestPitchesModel),
          ),
          TitlePitch(20.0, 20.0, "Sân đang được giảm giá"),
          SizedBox(
            height: 300.0,
            child: HotDealPitches(hotDealPitchesModel),
          ),
        ],
      ),
      bottomNavigationBar: FooterMenu(0),
    );
  }
}
