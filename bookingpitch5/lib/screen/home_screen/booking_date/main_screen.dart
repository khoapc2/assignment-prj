import 'package:bookingpitch5/models/sub_pitch/sub_pitch_model.dart';
import 'package:bookingpitch5/screen/home_screen/booking_date/ImageBanner.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/detail_pitch.dart';
import 'package:bookingpitch5/view_models/sub_pitch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:bookingpitch5/view_models/my_booking_view_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'button_pay.dart';
import 'calendar_container.dart';
import 'line_slot.dart';

class MainScreenBookingDate extends StatefulWidget {
  @override
  //ParamenterToDateBookingScreen pars;
  final int SubPitchId;

  MainScreenBookingDate(this.SubPitchId);

  MainScreenBookingDateState createState() => MainScreenBookingDateState(SubPitchId);
}

class MainScreenBookingDateState extends State<MainScreenBookingDate> {
  final timeStarts = ["06:00","07:00","08:00","09:00","10:00","11:00",
    "12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00",
    "23:00"
  ];
  List listNumberStart = [];
  final timeEnds = ["07:00","08:00","09:00","10:00","11:00",
    "12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00",
    "23:00","24:00"];


  String selectedTimeStart = "06:00";
  String selectedTimeEnd = "07:00";
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime(1967, 10, 12);
  late ButtonPay buttonPay;
  //ParamenterToDateBookingScreen pars;
  final int SubPitchId;
  MainScreenBookingDateState(this.SubPitchId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title:
              Text("Đặt sân"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ImageBanner(),
            TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay;// update `_focusedDay` here as well

                  });
                }),



            // GestureDetector(
            //   onTap: (){
            //     Navigator.of(context).pushNamed('/slotBooking',
            //     arguments: ParameterToSlotPitch(pars, _focusedDay, selectedTimeEnd, selectedTimeEnd));
            //     },
            //   child: Container(
            //     constraints:BoxConstraints.expand(
            //         height: 50.0
            //     ),
            //     margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: Colors.green
            //     ),
            //     child: Center(
            //         child: Text("Tìm trong khung giờ",
            //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //             textAlign: TextAlign.center)),
            //   ),
            // )

              ]..addAll(getDate())
            ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
  void _onDaySelected(DateTime selectedDay, DateTime focusDay) {
    var fasd = selectedDay;
    var fasdfadsf = focusDay;
  }

  Iterable<Widget> getDate(){
    var listSlot = getSlots();
    List<Widget> list = [];
    DateTime now = DateTime.now();
    var subPitch = SubPitchViewModel.getSubPitchById(SubPitchId);
    if(_selectedDay.compareTo(now) > 0){
      list.add(CalendarContainer(_selectedDay));
      // list.add(LineSlot("Người khác đã đặt"
      //     ));
      // list.add(Wrap(
      //   children: listSlot,
      // ));
      list.add(LineSlot("Thời gian đặt"
      ));
      list.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Column(
                children: [
                  Text("Thời gian bắt đầu",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 1)),

                      child:
                      DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          value: selectedTimeStart,
                          items: timeStarts.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            if(value == null)
                              return setState(() => selectedTimeStart = "06:00");
                            return setState(() => selectedTimeStart = value);
                          }
                      ))])
            ,
            Column(
                children: [
                  Text("Thời gian kết thúc",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1)),
                    child:
                    DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        value: selectedTimeEnd,
                        items: timeEnds.map(buildMenuItem).toList(),
                        onChanged: (value){
                          if(value == null)
                            return setState(() => {
                              selectedTimeEnd = "07:00",
                              //buttonPay = ButtonPay(SubPitchId, _selectedDay, selectedTimeStart, selectedTimeEnd, price);

                            });
                          return setState(() => selectedTimeEnd = value);
                        }),
                  )
                ])

          ]
      )
        ,);
      list.add(FutureBuilder(
        future: subPitch,
          builder: (BuildContext context,
          AsyncSnapshot<SubPitchModel> snapshot) {
            //return ButtonPay(SubPitchId,_selectedDay,selectedTimeStart, selectedTimeEnd,snapshot.data!.normalDay);
          return GestureDetector(
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

              var validateTimeModel = MyBookingViewModel.postValidationTime(SubPitchId, selectedTimeStart, selectedTimeEnd, DateFormat('MM-dd-yyyy').format(_selectedDay));
              validateTimeModel.then((value) {

                setState(() {
                  if(value.timeStartError == "Thời gian bắt đầu đã có người đặt"
                      || value.timeEndError == "Thời gian kết thúc đã có người đặt"){
                    var timeStart = value.timeStartError =="Not Error" ? "": value.timeStartError;
                    var timeEnd = value.timeEndError =="Not Error" ? "": value.timeEndError;
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Khung giờ không hợp lệ'),
                        content: Text(timeStart +"\n"
                            + timeEnd),
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
                    print("Khung giờ chưa có ai đặt");
                    MyBookingViewModel.createBooking(SubPitchId, selectedTimeStart, selectedTimeEnd, snapshot.data!.normalDay.toString(),
                        DateFormat('MM-dd-yyyy').format(_selectedDay)).then(
                            (value) => Navigator.of(context).pushNamed(
                                '/billPitch',
                                arguments: value.id));
                    ;
                  }
                });
              }
              );


            },
          );
        }));

      return list.map((e) => e);
    }
    if(_selectedDay.year == now.year && _selectedDay.month == now.month
    && _selectedDay.day == now.day){
      list.add(CalendarContainer(_selectedDay));
      list.add(LineSlot("Người khác đã đặt"));
      list.add(Wrap(
        children: listSlot,
      ));
      list.add(LineSlot("Thời gian đặt"
      ));
      list.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Column(
                children: [
                  Text("Thời gian bắt đầu",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 1)),

                      child:
                      DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          value: selectedTimeStart,
                          items: timeStarts.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            if(value == null)
                              return setState(() => selectedTimeStart = "06:00");
                            return setState(() => selectedTimeStart = value);
                          }
                      ))])
            ,
            Column(
                children: [
                  Text("Thời gian kết thúc",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1)),
                    child:
                    DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        value: selectedTimeEnd,
                        items: timeEnds.map(buildMenuItem).toList(),
                        onChanged: (value){
                          if(value == null)
                            return setState(() => selectedTimeEnd = "07:00");
                          return setState(() => selectedTimeEnd = value);
                        }),
                  )
                ])

          ]
      ),
        );

      list.add(FutureBuilder(
          future: subPitch,
          builder: (BuildContext context,
              AsyncSnapshot<SubPitchModel> snapshot) {
            //return ButtonPay(SubPitchId,_selectedDay,selectedTimeStart, selectedTimeEnd,snapshot.data!.normalDay);
            return GestureDetector(
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

                var validateTimeModel = MyBookingViewModel.postValidationTime(SubPitchId, selectedTimeStart, selectedTimeEnd, DateFormat('MM-dd-yyyy').format(_selectedDay));
                validateTimeModel.then((value) {

                  setState(() {
                    if(value.timeStartError == "Thời gian bắt đầu đã có người đặt"
                        || value.timeEndError == "Thời gian kết thúc đã có người đặt"){
                      var timeStart = value.timeStartError =="Not Error" ? "": value.timeStartError;
                      var timeEnd = value.timeEndError =="Not Error" ? "": value.timeEndError;
                      print("Khung giờ đã có người đặt");
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Khung giờ không hợp lệ'),
                          content: Text(timeStart +"\n"
                              + timeEnd),
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
                      print("Khung giờ chưa có ai đặt");
                      MyBookingViewModel.createBooking(SubPitchId, selectedTimeStart, selectedTimeEnd, snapshot.data!.normalDay.toString(),
                          DateFormat('MM-dd-yyyy').format(_selectedDay)).then(
                              (value) => Navigator.of(context).pushNamed(
                              '/billPitch',
                              arguments: value.id));
                      ;
                    }
                  });
                }
                );


              },
            );
          }));

      return list.map((e) => e);
    }
    list.add(Container());
    return list.map((e) => e);
  }

  List<Widget> getSlots(){
    List<Widget> list = [];
    var numberStart = 6;
    var numberEnd = 13;
    var count = 0;
    for(int i = numberStart; i < numberEnd ; i = numberStart){
      list.add(
        GestureDetector(
            onTap: () => changeStyle(i),
            child:  Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child:
                Column(
                    children: [
                      Icon(Icons.sports_soccer,
                          color: listNumberStart.contains(i)? Colors.green: Colors.red, size: 70.0),
                      Text((i+count).toString()+":00 - "+ (i+count+1).toString()+":00",
                          style: listNumberStart.contains(i)?TextStyle(fontWeight: FontWeight.bold): null ),
                      //Text("100,000 đồng",style: listNumberStart.contains(i)?TextStyle(fontWeight: FontWeight.bold): null),
                    ]))),
      );
      count ++;
      numberStart = i+count;
    }
    list.add(Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child:
        Column(
            children: [
              Icon(Icons.sports_soccer,
                  color: Colors.red, size: 70.0),
              Text("16:00 - "+ "17:30",
                 ),
              //Text("100,000 đồng",style: listNumberStart.contains(i)?TextStyle(fontWeight: FontWeight.bold): null),
            ])));
    return list;
  }

  changeStyle(int numberStart){

    setState(() {
      if(listNumberStart.length == 1){
        listNumberStart.removeAt(0);
      }
      listNumberStart.add(numberStart);
      selectedTimeStart = numberStart.toString() +":00";
      selectedTimeEnd = (numberStart+1).toString() +":00";
    });
  }
}



class ParameterToSlotPitch{
  final ParamenterToDateBookingScreen parsFromDetailPitch;
  final DateTime selectedDate;
  final String timeStart;
  final String timeEnd;
  ParameterToSlotPitch(this.parsFromDetailPitch, this.selectedDate, this.timeStart, this.timeEnd);
}


