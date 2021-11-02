
import 'dart:convert';

import 'package:bookingpitch5/models/booking_host/booking_host_model.dart';
import 'package:http/http.dart' as http;

class BookingHostService {
  var url = 'https://104.215.186.78/api/v1/bookings'; // server
  
  //add token
  Future<List<BookingHostModel>> getListBookedByHostID(id) async {
    final response =
        await http.get(Uri.parse(url + "/owner/" + id.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => BookingHostModel.fromJson(e)).toList();
    } else {
      return List.empty();
    }
  }

  Future<bool> paid(id) async {
    final response =
        await http.put(Uri.parse(url + "/paid/" + id.toString()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}