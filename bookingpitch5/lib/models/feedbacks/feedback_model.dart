
class FeedbackRequest{
  late int customerId;
  late int pitchId;
  late String content;
  late int rating;
  late int bookingId;

  FeedbackRequest({
      required this.customerId,
      required this.pitchId,
      required this.content,
      required this.rating,
      required this.bookingId
      });
 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['pitch_id'] = this.pitchId;
    data['content'] = this.content;
    data['rating'] = this.rating;
    data['booking_id'] = this.bookingId;
    return data;
  }
}

class FeedbackResponse{
  String customerName;
  String content;
  int rating;
  int bookingId;

  FeedbackResponse({
      required this.customerName,
      required this.content,
      required this.rating,
      required this.bookingId
      });

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) {
    return new FeedbackResponse(
        customerName : json['customer_name'],
        content : json['content'],
        rating : json['rating'],
        bookingId : json['booking_id']
    );
  }
}