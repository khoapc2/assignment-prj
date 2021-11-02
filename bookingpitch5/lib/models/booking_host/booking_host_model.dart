class BookingHostModel {
  int id;
  String customerName;
  String subPitchName;
  String subPitchType;
  String pitchName;
  String dateBooking;
  String timeStart;
  String timeEnd;
  String price;

  BookingHostModel({
      required this.id,
      required this.customerName,
      required this.subPitchName,
      required this.subPitchType,
      required this.pitchName,
      required this.dateBooking,
      required this.timeStart,
      required this.timeEnd,
      required this.price
      });

  factory BookingHostModel.fromJson(Map<String, dynamic> json) {
    return new BookingHostModel(
    id : json['id'],
    customerName : json['customer_name'],
    subPitchName : json['sub_pitch_name'],
    subPitchType : json['sub_pitch_type'],
    pitchName : json['pitch_name'],
    dateBooking : json['date_booking'],
    timeStart : json['time_start'],
    timeEnd : json['time_end'],
    price : json['price']);
  }

}