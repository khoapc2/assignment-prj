import 'package:bookingpitch5/models/detail_type_pitch.dart';
import 'package:bookingpitch5/models/pitch.dart';
import 'package:bookingpitch5/view_models/son_pitch_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DetailPitch extends StatelessWidget {
  final String name;
  final String imgPath;
  final String typePitch;
  final String normalDayPrice;
  final String specialDayPrice;
  final int subPitchID;

  // final DetailTypePitchModel detailTypePitchModel;
  // final PitchModel pitchModel;

  DetailPitch(this.subPitchID ,this.name, this.imgPath, this.typePitch, this.normalDayPrice,
      this.specialDayPrice,
      // this.detailTypePitchModel,
      // this.pitchModel
      );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.fromLTRB(10.0, 0, 0.0, 0),
      constraints: BoxConstraints.expand(width: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 150, width: 300),
            child: Image.asset(imgPath, fit: BoxFit.fill),
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            child: Row(
              children: [
                Text("Ngày thường: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(normalDayPrice + " VNĐ")
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text("Ngày cuối tuần: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(specialDayPrice + " VNĐ")
              ],
            ),
          ),
          Container(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/updateSonPitch', arguments: subPitchID);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            border:
                                Border.all(color: Colors.green, width: 5.0)),
                        child: Center(
                            child: Text("Sửa",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white))),
                      ),
                    )),
                FlatButton(
                    onPressed: () async {
                      showAlertDialogDelete(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                            border: Border.all(color: Colors.red, width: 5.0)),
                        child: Center(
                            child: Text("Xóa",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white))),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  showAlertDialogDelete(BuildContext context) {
    // set up the button
    bool isDelete = false;
    Widget okButton = FlatButton(
        hoverColor: Colors.red,
        child: Text("OK"),
        onPressed: () async {
          isDelete = await SonPitchViewModel.deleteSubPitch(subPitchID);
          if(isDelete) {
            Fluttertoast.showToast(
                msg: "Delete SubPitch Successful",
                fontSize: 18,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white);
          } else {
            Fluttertoast.showToast(
                msg: "Delete SubPitch Fail",
                fontSize: 18,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          }
          Navigator.pop(context);
        }
    );

    Widget cancelBtn = FlatButton(
      focusColor: Colors.blue,
      child: Text("Cancel"),
      onPressed: () => Navigator.pop(context, "Cancel"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Do you want to Delete this SubPitch"),
      actions: [okButton,cancelBtn],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }













}

class ParamenterToDateBookingScreen {
  final PitchModel pitchModel;
  final DetailTypePitchModel detailPitchModel;
  ParamenterToDateBookingScreen(this.pitchModel, this.detailPitchModel);
}
