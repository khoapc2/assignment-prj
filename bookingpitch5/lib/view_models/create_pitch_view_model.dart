import 'package:bookingpitch5/api/create_pitch_service.dart';
import 'package:bookingpitch5/models/mother_pitch_model.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


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
        new CreatePitchModel(owner_id, pitchName, phone, address, timeStart, timeEnd));
    return isCreate;
  }

  static String validateCreate(
      String pitchName,
      String phone,
      String address,
      String timeStart,
      String timeEnd) {
    var error = '';

    DateTime start;
    DateTime end;

    if (pitchName.length < 1 || pitchName.length > 50)
      error += 'Pitchname > 0 and length <= 50\n';
    if (phone.length != 10)
      error += 'Phone > 0 and length must equal 10 characters\n';
    if (address.length > 50)
      error += 'Address length must <= 50\n';
    try {
      start = new DateFormat.Hm().parse(timeStart);
      end = new DateFormat.Hm().parse(timeEnd);
      if(start.isAfter(end)){
        error += 'TimeStart must before TimeEnd\n';
      }
    } catch (Exception) {
      error += 'Time Format Invalid (Example = 10:00)\n';
    }
    return error;
  }
}