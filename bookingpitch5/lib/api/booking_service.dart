import 'dart:convert';
import 'dart:io';

import 'package:bookingpitch5/models/bookings/validate_time_model.dart';

import '../models/bookings/booking_model.dart';
import 'package:http/http.dart' as http;

class BookingService {
  var url = 'https://104.215.186.78/api/v1/bookings'; // server
  HttpClient client = HttpClient();

  //add token
  Future<List<BookingModel>> getListBookedByCustomerID(id) async {
    final response =
        await http.get(Uri.parse(url + "/booked/" + id.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => BookingModel.fromJson(e)).toList();
    } else {
      return List.empty();
    }
  }

  Future<List<BookingModel>> getListBookingHistoryByCustomerID(id) async {
    final response =
        await http.get(Uri.parse(url + "/history/" + id.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => BookingModel.fromJson(e)).toList();
    } else {
      return List.empty();
    }
  }

  Future<BookingModel> getBookingByID(id) async {
    var result;
    final response =
        await http.get(Uri.parse(url + "/" + id.toString()));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      result = BookingModel.fromJson(jsonResponse);
    } else {
      throw Exception(Exception);
    }
    return result;
  }

  //add token
  Future<bool> cancelBooking(int id, String reason) async {
    final response = await http.delete(
      Uri.parse(url + "/cancel"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"id": id, "cancel_reason": reason}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<ValidateTimeModel> postValidateTime(int id, String timeStart, String timeEnd, String dateBooking) async {
    final response = await http.post(Uri.parse("https://10.0.2.2:44322/api/v1/bookings/validate-time"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "sub_pitch_id": id.toString(),
          "date_booking" : dateBooking,
          'time_start' : timeStart,
          'time_end' : timeEnd,
        }
    ));
    ValidateTimeModel validateTimeModel;
    if (response.statusCode == 200) {
      validateTimeModel =  ValidateTimeModel.fromJson(jsonDecode(response.body));
      return validateTimeModel;
    }
      return validateTimeModel = new ValidateTimeModel(timeStartError: "Error", timeEndError: "Error");;
  }

  Future<BookingModel?> createBooking(int cusomterId, int subPitchId, String price, String timeStart, String
  timeEnd, String dateBooking) async {
    print("ngày đặt sân: "+dateBooking);
    final response = await http.post(Uri.parse("https://10.0.2.2:44322/api/v1/bookings"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "customer_id" : cusomterId.toString(),
          "sub_pitch_id": subPitchId.toString(),
          "date_booking" : dateBooking,
          'time_start' : timeStart,
          'time_end' : timeEnd,
          "price": price.toString(),
        }
        ));
    BookingModel bookingModel;
    if (response.statusCode == 201) {
      print("status code 200 trong hàm tạo mới booking");
      bookingModel =  BookingModel.fromJson(jsonDecode(response.body));
      return bookingModel;
    }
    return null;
  }

  Future<BookingModel> getBookingById(int id) async {
    String url = "https://10.0.2.2:44322/api/v1/bookings/" + id.toString();

    BookingModel profileModelResponse;

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });


    if(response.statusCode == 200){
      print("status là 200 trong service get bookingid");
      profileModelResponse = BookingModel.fromJson(json.decode(response.body));
      print("Get id booking ok");
    } else {
      throw Exception(Exception);
    }
    return profileModelResponse;
  }
}

