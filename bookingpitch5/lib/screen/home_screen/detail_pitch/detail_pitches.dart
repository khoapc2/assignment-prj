import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitch.dart';
import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';
import 'package:flutter/material.dart';

import 'detail_pitch.dart';

class DetailPitches extends StatelessWidget{
  final List<SubPitchModel> listSubPitchModel;
  DetailPitches(this.listSubPitchModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listPitches(),
    );
  }

  List<DetailPitch> listPitches(){
    return listSubPitchModel.map((SubPitchModel) => DetailPitch(SubPitchModel.id,SubPitchModel.name, SubPitchModel.img_path,
        SubPitchModel.typeOfPitch,SubPitchModel.normalDay, SubPitchModel.SpecialDayPrice)).toList();
  }

}