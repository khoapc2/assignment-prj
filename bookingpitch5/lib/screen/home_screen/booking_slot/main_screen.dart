import 'package:bookingpitch5/screen/home_screen/booking_date/main_screen.dart';
import 'package:bookingpitch5/screen/home_screen/booking_slot/button_pay.dart';
import 'package:bookingpitch5/screen/home_screen/booking_slot/calendar_container.dart';
import 'package:bookingpitch5/screen/home_screen/booking_slot/slot.dart';
import 'package:flutter/material.dart';

import 'line_slot.dart';

class MainScreenBookingSlot extends StatefulWidget {
  ParameterToSlotPitch pars;
  MainScreenBookingSlot(this.pars);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenBookingSlotState(pars);
  }


}
  class MainScreenBookingSlotState extends State<MainScreenBookingSlot> {
    ParameterToSlotPitch pars;
    String selectedTimeStart = "6:00";
    String selectedTimeEnd = "7:00";
    List listNumberStart = [];
    MainScreenBookingSlotState(this.pars);

    @override
    Widget build(BuildContext context) {
      var list = getSlots();
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title:
          Text(pars.parsFromDetailPitch.pitchModel.name + " - " + pars.parsFromDetailPitch.detailPitchModel.name),
          backgroundColor: Colors.green,
        ),
        body:
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            CalendarContainer(pars.selectedDate),
            LineSlot(),
            Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child:

                Wrap(
                    children: list
                )
            )
          ],
        ),
        bottomNavigationBar: ButtonPay(pars, selectedTimeStart, selectedTimeEnd),
      );
    }

    List<Widget> getSlots(){
      List<Widget> list = [];
      var numberStart = int.parse(pars.timeStart.substring(0,2));
      var numberEnd = int.parse(pars.timeEnd.substring(0,2));
      for(int i = numberStart; i < numberEnd ; i++){
        list.add(
          GestureDetector(
              onTap: () => changeStyle(i),
              child:  Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child:
                  Column(
                      children: [
                        Icon(Icons.sports_soccer,
                            color: listNumberStart.contains(i)? Colors.green: Colors.grey, size: 70.0),
                        Text(i.toString()+":00 - "+ (i+1).toString()+":00",
                            style: listNumberStart.contains(i)?TextStyle(fontWeight: FontWeight.bold): null ),
                        Text("100,000 đồng",style: listNumberStart.contains(i)?TextStyle(fontWeight: FontWeight.bold): null),
                      ]))),
        )
        ;
      }
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

