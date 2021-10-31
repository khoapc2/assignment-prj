import 'package:bookingpitch5/models/pitchs/pitch_model.dart';
import 'package:flutter/material.dart';
import 'pitch.dart';

class Pitches extends StatelessWidget{
  List<PitchModel> pitchesModel;
  Pitches(this.pitchesModel);

  @override
  Widget build(BuildContext context) {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: listPitches(),
      );
  }

  List<Pitch> listPitches(){
    return pitchesModel.map((pitchModel) => Pitch(pitchModel.id,pitchModel.img_path,
        pitchModel.name, pitchModel.location, pitchModel.time_start,pitchModel.time_end
        , pitchModel.phone, pitchModel.rates)).toList();
  }
}