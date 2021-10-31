
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

  FeedbackRequest.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    pitchId = json['pitch_id'];
    content = json['content'];
    rating = json['rating'];
    bookingId = json['booking_id'];
  }

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