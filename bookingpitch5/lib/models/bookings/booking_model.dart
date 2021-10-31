class BookingModel {
  late int id;
  late int customerID;
  late String customerName;
  late int subPitchID;
  late String subPitchName;
  late String subPitchImageUrl;
  late String subPitchType;
  late String pitchName;
  late String address;
  late String dateBooking;
  late String timeStart;
  late String timeEnd;
  late String price;
  late String status;
  late String cancelReason;
  late String createDate;

  BookingModel({
    required this.id,
    required this.customerID,
    required this.customerName,
    required this.subPitchID,
    required this.subPitchName,
    required this.subPitchImageUrl,
    required this.subPitchType,
    required this.pitchName,
    required this.address,
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
      id : json['id'], 
      customerID : json['customer_id'], 
      customerName : json['customer_name'], 
      subPitchID : json['sub_pitch_id'],
      subPitchName : json['sub_pitch_name'], 
      subPitchImageUrl : json['sub_pitch_image_url'],
      subPitchType : json['sub_pitch_type'],
      pitchName : json['pitch_name'], 
      address : json['address'],
      dateBooking : json['date_booking'], 
      timeStart : json['time_start'], 
      timeEnd : json['time_end'], 
      price : json['price'], 
      status : json['status'], 
      cancelReason : json['cancel_reason'], 
      createDate : json['create_date']);
  }
  Map<String, dynamic> toJson(Map<String, dynamic> json){
    final _data = <String, dynamic>{};
    _data['customer_id'] = customerID;
    _data['sub_pitch_id'] = subPitchID;
    _data['date_booking'] = dateBooking;
    _data['time_start'] = timeStart;
    _data['time_end'] = timeEnd;

    return _data;
  }

}
