import 'package:bookingpitch5/screen/home_screen/booking_date/ImageBanner.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/detail_pitch.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'button_pay.dart';
import 'calendar_container.dart';
import 'line_slot.dart';

class MainScreenBookingDate extends StatefulWidget {
  @override
  ParamenterToDateBookingScreen pars;
  MainScreenBookingDate(this.pars);

  MainScreenBookingDateState createState() => MainScreenBookingDateState(pars);
}

class MainScreenBookingDateState extends State<MainScreenBookingDate> {
  final timeStarts = ['16:00', "16:30", "17:00","17:30","18:00","18:30", "19:00","19:00","19:30",
  ];
  List listNumberStart = [];
  final timeEnds = [ "16:30", "17:00","17:30","18:00","18:30", "19:00","19:00","19:30",];


  String selectedTimeStart = "16:00";
  String selectedTimeEnd = "16:30";
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime(1967, 10, 12);
  ParamenterToDateBookingScreen pars;
  MainScreenBookingDateState(this.pars);

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
              Text(pars.pitchModel.name + " - " + pars.detailPitchModel.name),
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
                        focusedDay; // update `_focusedDay` here as well
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
    if(_selectedDay.compareTo(now) > 0){
      list.add(CalendarContainer(_selectedDay));
      list.add(LineSlot("Người khác đã đặt"
          ));
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
      )
        ,);

      list.add(ButtonPay(pars , _selectedDay,selectedTimeStart, selectedTimeEnd));

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

      list.add(ButtonPay(pars , _selectedDay,selectedTimeStart, selectedTimeEnd));

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


