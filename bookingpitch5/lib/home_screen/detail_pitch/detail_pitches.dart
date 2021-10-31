
import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitch.dart';
import 'package:bookingpitch5/models/son_pitchs/son_pitch_model.dart';
import 'package:flutter/material.dart';

import 'detail_pitch.dart';

class DetailPitches extends StatelessWidget{
  final List<GetSonPitchModel> detailPitchModel;
  // final PitchModel pitchModel;
  DetailPitches(this.detailPitchModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listPitches(),
    );
  }


  List<DetailPitch> listPitches(){
    return detailPitchModel.map((detailPitchModel) => DetailPitch(detailPitchModel.son_pitch_id, detailPitchModel.pitchName, "assets/images/img1.jpg",
        detailPitchModel.type_of_pitch,detailPitchModel.normal_day_price.toString(), detailPitchModel.special_day_price.toString())).toList();

  }
}