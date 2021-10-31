import 'package:bookingpitch5/api/api_sub_pitch_service.dart';
import 'package:bookingpitch5/api/pitch_get_service.dart';
import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';

class SubPitchViewModel {

  static Future<List<SubPitchModel>> getListSubPitchByTypeOfPitch(String typeOfPitch) async {
    SubPitchServce service = new SubPitchServce();
    // var id = await prefs.getInt('id');
    var result = await service.getListSubPitchByTypeOfPitch(typeOfPitch);
    return result;
  }

  static Future<List<SubPitchModel>> getListSubPitchByPitchId(int pitchId) async {
    SubPitchServce service = new SubPitchServce();
    // var id = await prefs.getInt('id');
    var result = await service.getListSubPitchByPitchId(pitchId);
    return result;
  }

  static Future<SubPitchModel> getSubPitchById(int subPitch) async {
    SubPitchServce service = new SubPitchServce();
    var result = await service.getSubPitchById(subPitch);
    return result!;
  }

}