import 'package:bookingpitch5/models/bookings/validate_time_model.dart';
import 'package:bookingpitch5/view_models/my_booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class ButtonPay extends StatefulWidget {
  //final ParamenterToDateBookingScreen pars;
  DateTime dateSelected;
  String timeStartSelected;
  String timeEndSelected;
  int subPitchId;
  int price;

  ButtonPay(this.subPitchId, this.dateSelected, this.timeStartSelected,
      this.timeEndSelected, this.price);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonPayState(subPitchId, dateSelected, timeStartSelected,
        timeEndSelected, price);
  }
}

class ButtonPayState extends State<ButtonPay>{
  DateTime dateSelected;
  String timeStartSelected;
  String timeEndSelected;
  int subPitchId;
  int price;
  ButtonPayState(this.subPitchId, this.dateSelected, this.timeStartSelected,
      this.timeEndSelected, this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(
            height: 50.0
        ),
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green
        ),
        child: Center(

            child: Text("Đặt sân",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center)),
      ),
  //     onTap: (){
  //       Navigator.of(context).pushNamed('/billPitch',
  //   arguments: ParameterToBillPitch(pars.pitchModel.name,pars.pitchModel.location,
  //   pars.detailPitchModel.name,pars.detailPitchModel.typePitch,dateSelected,
  //   timeStartSelected, timeEndSelected, "100.000 đồng"));
  // },

      onTap: (){
        print( "xem ngày"+dateSelected.toString());
        print( "xem ngày"+DateFormat('MM-dd-yyyy').format(dateSelected));
        var validateTimeModel = MyBookingViewModel.postValidationTime(subPitchId, timeStartSelected, timeEndSelected, DateFormat('MM-dd-yyyy').format(dateSelected));
        validateTimeModel.then((value) {
          print("vào rồi nè ông già");
          setState(() {
            if(value.timeStartError == "Thời gian bắt đầu đã có người đặt"
                || value.timeStartError == "Thời gian kết thúc đã có người đặt"){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Khung giờ không hợp lệ'),
                  content: Text(value.timeStartError +"\n"
                      + value.timeStartError),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
            else{
              MyBookingViewModel.createBooking(subPitchId, timeStartSelected, timeEndSelected, price.toString(),
                  DateFormat('MM-dd-yyyy').format(dateSelected));
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('OK con dê'),
                  content: Text(value.timeStartError +"\n"
                      + value.timeStartError),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          });
        }
        );


        },
    );

  }
}

class ParameterToBillPitch {
  final String namePitch;
  final String address;
  final String detailPitch;
  final String typeOfPitch;
  final DateTime dateBooking;
  final String timeStartedSeleted;
  final String timeEndSeleted;
  final String price;

  ParameterToBillPitch(this.namePitch, this.address, this.detailPitch,
      this.typeOfPitch, this.dateBooking,this.timeStartedSeleted,this.timeEndSeleted,
      this.price);
}