import 'package:bookingpitch5/api/create_pitch_service.dart';
import 'package:bookingpitch5/models/mother_pitch_model.dart';

class CreatePitchViewModel {
  static Future<bool> createPitch(
      int owner_id,
      String pitchName,
      String address,
      String phone,
      String timeStart,
      String timeEnd) async {
    CreatePitchService createPitchService = new CreatePitchService();
    var isCreate = await createPitchService.createPitchModel(
        new CreatePitchModel(owner_id, pitchName, address, phone, timeStart, timeEnd));
    return isCreate;
  }
}