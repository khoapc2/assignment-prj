class BookingModel {
  int id;
  int customerID;
  String customerName;
  int subPitchID;
  String subPitchName;
  String subPitchImageUrl;
  String subPitchType;
  int pitchID;
  String pitchName;
  String address;
  String phone;
  String dateBooking;
  String timeStart;
  String timeEnd;
  String price;
  String status;
  String cancelReason;
  String createDate;

  BookingModel({
    required this.id,
    required this.customerID,
    required this.customerName,
    required this.subPitchID,
    required this.subPitchName,
    required this.subPitchImageUrl,
    required this.subPitchType,
    required this.pitchID,
    required this.pitchName,
    required this.address,
    required this.phone,
    required this.dateBooking,
    required this.timeStart,
    required this.timeEnd,
    required this.price,
    required this.status,
    required this.cancelReason,
    required this.createDate,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return new BookingModel(
        id: json['id'],
        customerID: json['customer_id'],
        customerName: json['customer_name'],
        subPitchID: json['sub_pitch_id'],
        subPitchName: json['sub_pitch_name'],
        subPitchImageUrl: json['sub_pitch_image_url'],
        subPitchType: json['sub_pitch_type'],
        pitchID : json['pitch_id'],
        pitchName: json['pitch_name'],
        address: json['address'],
        phone: json['phone'],
        dateBooking: json['date_booking'],
        timeStart: json['time_start'],
        timeEnd: json['time_end'],
        price: json['price'],
        status: json['status'],
        cancelReason: json['cancel_reason'],
        createDate: json['create_date']);
  }
}
