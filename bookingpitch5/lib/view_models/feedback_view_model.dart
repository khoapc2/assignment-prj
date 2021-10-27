

import 'package:bookingpitch5/api/feedback_api.dart';
import 'package:bookingpitch5/models/feedbacks/feedback_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackViewModel{


  Future<bool> createFeedback(int _pitchId, String _content, int _rating, int _bookingId) 
    async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int customer_id = prefs.getInt('id');
      FeedbackService serives = new FeedbackService();
      var result = await serives.createFeedback(
        new FeedbackRequest(
          customerId: customer_id, 
          pitchId: _pitchId, 
          content: _content, 
          rating: _rating, 
          bookingId: _bookingId)
      );
        return result;
    }
}