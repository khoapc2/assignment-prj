class ValidateTimeModel {
  String timeStartError;
  String timeEndError;

 ValidateTimeModel({
   required this.timeStartError, required this.timeEndError
  });

  factory ValidateTimeModel.fromJson(Map<String, dynamic> json) {
    return new ValidateTimeModel(
        timeStartError : json["time_start_error"],
        timeEndError : json["time_end_error"]
    );
  }
}
