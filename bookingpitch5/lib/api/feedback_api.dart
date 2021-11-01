

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookingpitch5/models/feedbacks/feedback_model.dart';

class FeedbackService{
  Future<bool> createFeedback(FeedbackRequest feedbackRequest) async {
    String url = "https://104.215.186.78/api/Feedbacks";
    
    
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(feedbackRequest.toJson()));

    if(response.statusCode == 200){
      return true;
    } else {
      throw Exception(Exception);
    }  
  }

  Future<List<FeedbackResponse>> getFeedbackByPitchID(int id) async {
    String url = "https://104.215.186.78/api/Feedbacks?PitchId=" + id.toString();
    
    
    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },);

    if(response.statusCode == 200){
      List feedbackResponses = json.decode(response.body);
      return feedbackResponses.map((e) => FeedbackResponse.fromJson(e)).toList();
    } else {
      throw Exception(Exception);
    }  
  }
}