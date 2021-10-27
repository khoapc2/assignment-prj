import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bookingpitch5/models/bookings/booking_model.dart';

class BookingService {
  var url = 'https://104.215.186.78/api/v1/bookings'; // server
  HttpClient client = HttpClient();

  //add token
  Future<List<BookingModel>> getListBookedByCustomerID(id) async {
    final response = await http.get(Uri.parse(url+ "/booked/" + id.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
        .map((e) => BookingModel.fromJson(e))
        .toList();
    } else {
      return List.empty();
    }
  }

  Future<List<BookingModel>> getListBookingHistoryByCustomerID(id) async {
    final response = await http.get(Uri.parse(url+ "/history/" + id.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
        .map((e) => BookingModel.fromJson(e))
        .toList();
    } else {
      return List.empty();
    }
  }

  //add token
  Future<bool> cancelBooking(int id, String reason) async {
    final response = await http.delete(
    Uri.parse(url + "/cancel"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "id": id,
      "cancel_reason": reason
    }),
  );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
