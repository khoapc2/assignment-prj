import 'package:bookingpitch5/api/api_son_pitch_service.dart';
import 'package:bookingpitch5/models/son_pitchs/son_pitch_model.dart';

class SonPitchViewModel {
  static Future<bool> createPitch(int pitch_id, String typeOfPitch,
      int normalPrice, int specialPrice, String pitchName) async {
    SonPitchService service = new SonPitchService();
    print(pitch_id);
    var isCreate = await service.createSonPitchModel(
        new CreateSonPitchModel(
            pitchName, typeOfPitch, pitch_id, normalPrice, specialPrice));
    return isCreate;
  }

  static String validateField(String pitchName, String normalDayPrice, String specialDayPrice) {
    var error = '';
    int normalPrice;
    int specicalPrice;
    if (pitchName.length < 1 || pitchName.length > 50)
      error += 'Pitchname > 0 and length <= 50\n';
    try {
      normalPrice = int.parse(normalDayPrice);
      specicalPrice = int.parse(specialDayPrice);
      if(normalPrice < 0){
        error += "Normal Day Price must > 0\n";
      }else if(specicalPrice < 0) {
        error += "Special Day Price must > 0\n";
      }
    } catch (Exception) {
      error += 'Price must be a number';
    }
    return error;
  }
}