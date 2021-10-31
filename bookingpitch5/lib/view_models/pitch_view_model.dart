
import 'package:bookingpitch5/api/pitch_get_service.dart';
import 'package:bookingpitch5/api/pitch_service.dart';
import 'package:bookingpitch5/home_screen/detail_pitch/detail_pitch.dart';
import 'package:bookingpitch5/models/mother_pitch_model.dart';
import 'package:bookingpitch5/models/pitchs/pitch_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PitchViewModel {
  static Future<bool> updatePitch(
      int owner_id,
      int idPitch,
      String img,
      String pitchName,
      String address,
      String phone,
      String timeStart,
      String timeEnd) async {
    PitchService service = new PitchService();
    var isUpdate = await service.updatePitch(new GetPitchModelDetail(
      idPitch: idPitch,
      pitch_owner_id: owner_id,
      name: pitchName,
      location: address,
      img_path: img,
      phone: phone,
      time_start: timeStart,
      time_end: timeEnd,
    ));
    return isUpdate;
  }

static Future<List<PitchModel>> getListHightRatePitch() async {
PitchServce service = new PitchServce();
// var id = await prefs.getInt('id');
var result = await service.getListHightRatePitches();
return result;
}

  static Future<GetPitchModelDetail> getPitchByPitchID(pitchID) async {
    PitchService service = new PitchService();
    var result = await service.getPitchID(pitchID);
    print(result);
    return result;
  }

static Future<List<PitchModel>> getListPitchByName(String searchValue) async {
PitchServce service = new PitchServce();
// var id = await prefs.getInt('id');
var result = await service.getListPitchByName(searchValue);
return result;
}

  static Future<List<GetPitchModel>> getListPitchByOwnerID() async {
    var prefs = await SharedPreferences.getInstance();
    PitchService service = new PitchService();
    var id = await prefs.getInt('id');
    var result = await service.getPitchModel(id);
    return result;
  }

static Future<PitchModel> getPitchById(int id) async {
PitchServce service = new PitchServce();
var result = await service.getPitchById(id);
return result;
}

  static Future<bool> createPitch(int owner_id, String pitchName,
      String address, String phone, String timeStart, String timeEnd) async {
    PitchService createPitchService = new PitchService();
    var isCreate = await createPitchService.createPitchModel(
        new CreatePitchModel(
            owner_id, pitchName, phone, address, timeStart, timeEnd));
    return isCreate;
  }

  //Fix later
  static Future<bool> deletePitch(int owner_id) async {
    PitchService service = new PitchService();
    var isCreate = await service.deletePitch(owner_id);
    return isCreate;
  }

  static String tranferTimeFormat(String time) {
    String timeHs = "";
    DateTime datetime = new DateFormat.Hm().parse(time);
    timeHs = DateFormat('hh:mm').format(datetime);
    return timeHs;
  }

  static Future<List<PitchModel>> getRecommandPitch() async {
    PitchServce service = new PitchServce();
    var result = await service.getRecommandPitches();
    return result;
  }

  static String validateCreate(String pitchName, String phone, String address,
      String timeStart, String timeEnd) {
    var error = '';

    DateTime start;
    DateTime end;

    if (pitchName.length < 1 || pitchName.length > 50)
      error += 'Pitchname > 0 and length <= 50\n';
    if (phone.trim().length != 10)
      error += 'Phone > 0 and length must equal 10 characters\n';
    if (address.length > 500) error += 'Address length must <= 50\n';
    try {
      start = new DateFormat.Hm().parse(timeStart);
      end = new DateFormat.Hm().parse(timeEnd);
      if (start.isAfter(end)) {
        error += 'TimeStart must before TimeEnd\n';
      }
    } catch (Exception) {
      error += 'Time Format Invalid (Example = 10:00)\n';
    }
    return error;
  }
}
