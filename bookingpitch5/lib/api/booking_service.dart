import 'dart:convert';
import 'dart:io';

import '../models/bookings/booking_model.dart';


class BookingService {
  var url = 'https://104.215.186.78/api/v1/bookings'; // server
  HttpClient client = HttpClient();

  //add token
  Future<List<BookingModel>> getListBookedByCustomerID(id) async {
    List<BookingModel> result = List.empty();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request =
        await client.getUrl(Uri.parse(url + "/booked/" + id.toString()));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      // response.transform(utf8.decoder).listen((data) {
      //   List d = jsonDecode(data);
      //   result = d.map((e) => BookingModel.fromJson(e)).toList(); //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      // });
      List data = jsonDecode(await response.transform(utf8.decoder).join());
      result = data.map((e) => BookingModel.fromJson(e)).toList();
      return result;
    } else {
      return result;
    }
  }

  //add token
  Future<bool> cancelBooking(int id, String reason) async {
    var data = {
      "id": id,
      "cancel_reason": reason
    };
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request =
        await client.deleteUrl(Uri.parse(url + "/cancel"));
    request.headers.set('content-type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(json.encode(data)));
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
