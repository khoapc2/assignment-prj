

import 'package:bookingpitch5/api/pitch_get_service.dart';
import 'package:bookingpitch5/models/pitchs/pitch_model.dart';

class PitchViewModel {

  static Future<List<PitchModel>> getListPitchByName(String searchValue) async {
    PitchServce service = new PitchServce();
    // var id = await prefs.getInt('id');
    var result = await service.getListPitchByName(searchValue);
    return result;
  }

  static Future<List<PitchModel>> getListHightRatePitch() async {
    PitchServce service = new PitchServce();
    // var id = await prefs.getInt('id');
    var result = await service.getListHightRatePitches();
    return result;
  }

  static Future<PitchModel> getPitchById(int id) async {
    PitchServce service = new PitchServce();
    var result = await service.getPitchById(id);
    return result;
  }

}