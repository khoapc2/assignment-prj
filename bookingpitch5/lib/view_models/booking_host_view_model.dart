

import 'package:bookingpitch5/api/api_booking_host.dart';
import 'package:bookingpitch5/api/booking_service.dart';
import 'package:bookingpitch5/models/booking_host/booking_host_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingHostViewModel{
  static List<String> reasonList = [
    'Sân đang sửa chữa',
    'Sân hỏng',
    'Không thích',
    'Lý do khác'
  ];

   static Future<List<BookingHostModel>> getListBookedByHostID() async {
    final prefs = await SharedPreferences.getInstance();
    BookingHostService service = new BookingHostService();
    var id = await prefs.getInt('id');
    var result = await service.getListBookedByHostID(id);
    return Future.delayed(Duration(milliseconds: 3000))
                 .then((onValue) => result);
  }

  static Future<bool> cancelBooking(int id, String reason) async {
    BookingService service = new BookingService();
    var result = await service.cancelBooking(id, reason);
    return result;
  }

    static Future<bool> paid(int id) async {
    BookingHostService service = new BookingHostService();
    var result = await service.paid(id);
    return result;
    
  }

}