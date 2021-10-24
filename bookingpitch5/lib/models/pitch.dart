import 'detail_type_pitch.dart';

class PitchModel{
   final String id;
   final String name;
   final String location;
   final String imgPath;
   final String imgDetailPatch;
   final String time;
   final String distance;
   final int rates;
   int totalPitch5;
   int totalPitch7;
   int totalPitch11;
   int totalPitchfusan;

   List<DetailTypePitchModel> listDetailTypePitch;

   PitchModel(this.id, this.name, this.location, this.imgPath,this.imgDetailPatch, this.time, this.distance, this.rates, this.totalPitch5,
       this.totalPitch7, this.totalPitch11, this.totalPitchfusan, this.listDetailTypePitch);


}