import 'package:bookingpitch5/models/pitches.dart';
import 'package:flutter/material.dart';

import 'hot_deal_pitch.dart';

class HotDealPitches extends StatelessWidget{
  final PitchesModel pitchesModel;
  HotDealPitches(this.pitchesModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listPitches(),
    );
  }

  List<HotDealPitch> listPitches(){
    return pitchesModel.listPitches.map((pitchModel) => HotDealPitch(pitchModel.id,pitchModel.imgPath,
        pitchModel.name, pitchModel.location, pitchModel.time, pitchModel.distance, pitchModel.rates, pitchModel.listDetailTypePitch[0].nameDiscount,
        pitchModel.listDetailTypePitch[0].remainPrice, pitchModel.listDetailTypePitch[0].normalDayPrice)).toList();
  }
}