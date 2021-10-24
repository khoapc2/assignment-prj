import 'detail_type_pitch.dart';
import 'pitch.dart';

class PitchesModel{
  final List<PitchModel> listPitches;
  PitchesModel(this.listPitches);

   static PitchesModel fetchNearestPitch(){
    return new PitchesModel(
       <PitchModel>[
        PitchModel("1","Sân nhà văn hóa", "Quận Gò Vấp","assets/images/sanbanh1.png","assets/images/DetailPitch.png", "6:00-9:00",
            "300m", 3, 4,
            1, 0, 0,
            <DetailTypePitchModel>[
              DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",1),
              DetailTypePitchModel("Sân B","assets/images/sanbanh2.jpg", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",2),
              DetailTypePitchModel("Sân C","assets/images/sanbanh3.jpg", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",3),
              DetailTypePitchModel("Sân D","assets/images/sanbanh4.jpg", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",4),
              DetailTypePitchModel("Sân E","assets/images/sanbanh5.jpg", "Sân 7", "100,000 VNĐ", "200,000 VNĐ","","",5)
            ]),
         PitchModel("2","Sân nhà vĩnh hiệp", "Quận Gò Vấp","assets/images/sanbanh2.jpg","assets/images/DetailPitch.png", "6:00-9:00",
             "200m", 2, 0,
             0, 1, 0,
             <DetailTypePitchModel>[
               DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 11", "100,000 VNĐ", "200,000 VNĐ","","",0),
             ]),
         PitchModel("3","Sân nhà hữu nhường", "Quận Gò Vấp","assets/images/sanbanh3.jpg","assets/images/DetailPitch.png", "6:00-9:00",
             "100m", 1, 2,
             0, 0, 0,
             <DetailTypePitchModel>[
               DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",0),
               DetailTypePitchModel("Sân B","assets/images/sanbanh1.png", "Sân 5", "100,000 VNĐ", "200,000 VNĐ","","",0)
             ]),
      ]
    );
  }

  static PitchesModel fetchHighestRatePitch() {
    return new PitchesModel(
        <PitchModel>[
          PitchModel(
              "4",
              "Sân Đồng Nai",
              "Quận 10",
              "assets/images/sanbanh6.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "2km",
              5,
              4,
              1,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh2.jpg", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
                DetailTypePitchModel(
                    "Sân C", "assets/images/sanbanh3.jpg", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
                DetailTypePitchModel(
                    "Sân D", "assets/images/sanbanh4.jpg", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
                DetailTypePitchModel(
                    "Sân E", "assets/images/sanbanh5.jpg", "Sân 7",
                    "100,000 VNĐ", "200,000 VNĐ","","",0)
              ]),
          PitchModel(
              "5",
              "Sân Lê Đoàn",
              "Quận 3",
              "assets/images/sanbanh7.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "2.5km",
              5,
              0,
              0,
              1,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 11",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
              ]),
          PitchModel(
              "6",
              "Sân Thanh Tâm",
              "Quận 9",
              "assets/images/sanbanh8.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "1km",
              5,
              2,
              0,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh1.png", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","","",0)
              ]),
        ]
    );
  }

  static PitchesModel fetchHotDeal() {
    return new PitchesModel(
        <PitchModel>[
          PitchModel(
              "7",
              "Sân Chi Pu",
              "Quận 2",
              "assets/images/sanbanh9.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "6km",
              4,
              4,
              1,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "150,000 VNĐ", "200,000 VNĐ","Sân A","200,000 VNĐ",0),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh2.jpg", "Sân 5",
                    "200,000 VNĐ", "200,000 VNĐ","Sân B","30%",0),
                DetailTypePitchModel(
                    "Sân C", "assets/images/sanbanh3.jpg", "Sân 5",
                    "250,000 VNĐ", "200,000 VNĐ","Sân E","15%",0),
                DetailTypePitchModel(
                    "Sân D", "assets/images/sanbanh4.jpg", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","Sân C","40%",0),
                DetailTypePitchModel(
                    "Sân E", "assets/images/sanbanh5.jpg", "Sân 7",
                    "100,000 VNĐ", "200,000 VNĐ","Sân A","40%",0)
              ]),
          PitchModel(
              "8",
              "Sân Đàm Vĩnh Hưng",
              "Quận Phú Nhuận",
              "assets/images/sanbanh10.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "10.5km",
              5,
              0,
              0,
              1,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 11",
                    "200,000 VNĐ", "200,000 VNĐ", "Sân B","150,000 VNĐ",0),
              ]),
          PitchModel(
              "9",
              "Sân Phú Cường",
              "Quận 11",
              "assets/images/sanbanh11.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "1km",
              5,
              2,
              0,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "250,000 VNĐ", "200,000 VNĐ","Sân E","130,000 VNĐ",0),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh1.png", "Sân 5",
                    "100,000 VNĐ", "200,000 VNĐ","Sân E","15%",0)
              ]),
        ]
    );
  }

  static PitchModel? getPitchById(String id){
       PitchesModel pitches = fetchNearestPitch();
       for(int i = 0 ; i < pitches.listPitches.length;i++){
         if(pitches.listPitches[i].id == id){
            return pitches.listPitches[i];
         }
       }
       pitches = fetchHighestRatePitch();
       for(int i = 0 ; i < pitches.listPitches.length;i++){
         if(pitches.listPitches[i].id == id){
           return pitches.listPitches[i];
         }
       }
       pitches = fetchHighestRatePitch();
       for(int i = 0 ; i < pitches.listPitches.length;i++){
         if(pitches.listPitches[i].id == id){
           return pitches.listPitches[i];
         }
       }
       return null;
  }
}