import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationPitch extends StatelessWidget{
  final String namePitch;
  final String address;
  final String detailPitch;
  final String typeOfPitch;
  final DateTime dateBooking;
  final String timeStartedSeleted;
  final String timeEndSeleted;
  final String price;

  InformationPitch(this.namePitch, this.address, this.detailPitch,
      this.typeOfPitch, this.dateBooking,this.timeStartedSeleted,this.timeEndSeleted,
      this.price);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0)
      ),
      child: Column(
        children: [
          ListTile(
            leading: Text("Tên Sân:"),
            title: Text(namePitch,
            style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Địa chỉ:"),
            title: Text(address,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Số sân:"),
            title: Text(detailPitch,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Thể loại sân:"),
            title: Text(typeOfPitch,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Ngày nhân sân"),
            title: Text(DateFormat('dd/MM/yyyy').format(dateBooking),
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Text("Giờ đá"),
            title: Text(timeStartedSeleted + "-" + timeEndSeleted,
              style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: Text(price,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Text("Phương thức thanh toán"),
            title: Text("Thanh toán bằng tiền mặt",
              style: TextStyle(fontWeight: FontWeight.bold),),

          ),
        ],
      ),
    );
  }
}