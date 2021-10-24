import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slot extends StatefulWidget {
  final String timeStart;
  final String timeEnd;
  String selectedTimeEnd;
  String selectedTimeStart;

  Slot(this.timeStart, this.timeEnd, this.selectedTimeStart, this.selectedTimeEnd);
  SlotState createState() => SlotState(timeStart, timeEnd, selectedTimeStart, selectedTimeEnd);
}

class SlotState extends State<Slot> {
  final String timeStart;
  final String timeEnd;
  String selectedTimeStart;
  String selectedTimeEnd;
  List listNumberStart = [];
  SlotState(this.timeStart, this.timeEnd, this.selectedTimeStart, this.selectedTimeEnd);

  @override
  Widget build(BuildContext context) {

    var list = getSlots();
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        child:

        Wrap(
          children: list
        )
    );
  }

  List<Widget> getSlots(){
    List<Widget> list = [];
    var numberStart = int.parse(timeStart.substring(0,2));
    var numberEnd = int.parse(timeEnd.substring(0,2));
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
