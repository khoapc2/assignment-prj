import 'package:bookingpitch5/screen/home_screen/main_screen/my_voucher.dart';
import 'package:bookingpitch5/screen/home_screen/voucher/voucher.dart';
import 'package:flutter/material.dart';


class VoucherTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ví Coupon'),
            centerTitle: true,
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Mã cá nhân', icon: Icon(Icons.qr_code)),
                Tab(text: 'Deal hot khuyến mãi', 
                icon: Icon(Icons.local_fire_department_outlined),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children:[
                  VoucherItem(10.0, 20.0),
                  VoucherItem(10.0, 20.0)
                ],
              ),
              ListView(
                scrollDirection: Axis.vertical,
                children:[
                  VoucherItem(10.0, 20.0),
                  VoucherItem(10.0, 20.0)
                ],
              ),
            ],
          ),
        ),
      );
}
