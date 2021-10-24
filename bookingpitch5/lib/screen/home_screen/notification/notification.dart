import 'package:bookingpitch5/screen/home_screen/footer_menu.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông báo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: NotificationList(),
      bottomNavigationBar: FooterMenu(2),
    );
  }
}

class NotificationList extends StatefulWidget {
  NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotificationItem(
            "Sân 5",
            "7:00",
            "10/10/2021",
            "assets/images/img1.jpg",
            "Khu Liên Hiệp Thể Thao TNG",
            "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.",
            "Đặt sân thành công"),
          NotificationItem(
            "Sân 7",
            "16:00",
            "22/10/2021",
            "assets/images/img2.jpg",
            "Sân bóng Hoàng Phú",
            "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.",
            "Đặt sân thành công"),
          NotificationItem(
            "Sân 5",
            "18:00",
            "30/10/2021",
            "assets/images/sanbanh7.jpg",
            "Sân Chi Boo",
            "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.",
            "Đặt sân thành công"),
        ])
    );
  }
}

class NotificationItem extends StatefulWidget {
  var type, time, date, img, name, address, message;

  NotificationItem(this.type, this.time, this.date, this.img, this.name, this.address,
      this.message,
      {Key? key})
      : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
            Text(widget.type,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(widget.time, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 20),
              Text(widget.date, style: const TextStyle(color: Colors.grey))
            ])
          ]),
          Row(
            children: [
              Image(
                image: AssetImage(widget.img),
                width: 100,
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 255,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.name,
                        style:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(widget.address, maxLines: 3),
                    const SizedBox(height: 10),
                    const Text("800,000đ - Tiền mặt"),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(widget.message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
              ]
            )
        ],
      ),
    );
  }
}