import 'package:bookingpitch5/models/pitches.dart';
import 'package:flutter/material.dart';
import 'pitch.dart';

class Pitches extends StatelessWidget{
  final PitchesModel pitchesModel;
  Pitches(this.pitchesModel);

  @override
  Widget build(BuildContext context) {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: listPitches(),
      );
  }

  List<Pitch> listPitches(){
    return pitchesModel.listPitches.map((pitchModel) => Pitch(pitchModel.id,pitchModel.imgPath,
        pitchModel.name, pitchModel.location, pitchModel.time, pitchModel.distance, pitchModel.rates)).toList();
  }
}