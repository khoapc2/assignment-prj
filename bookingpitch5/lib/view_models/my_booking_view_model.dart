import 'package:bookingpitch5/models/bookings/booking_model.dart';
import 'package:bookingpitch5/api/booking_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBookingViewModel {

  static Future<List<BookingModel>> getListBookedByCustomerID() async {
    final prefs = await SharedPreferences.getInstance();
    BookingService service = new BookingService();
    // var id = await prefs.getInt('id');
    var id = 2; /////////////////////////////////////////
    var result = await service.getListBookedByCustomerID(id);
    return result;
  }

}
