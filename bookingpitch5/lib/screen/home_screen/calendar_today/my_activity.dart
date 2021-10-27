import 'package:bookingpitch5/models/bookings/booking_model.dart';
import 'package:bookingpitch5/screen/home_screen/footer_menu.dart';
import 'package:bookingpitch5/screen/home_screen/login/widgets/login_form.dart';
import 'package:bookingpitch5/view_models/my_booking_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class CalendarToday extends StatelessWidget {
  const CalendarToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Hoạt động của tôi",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.green,
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("Sân đã đặt", style: TextStyle(fontSize: 16))),
                Tab(
                    child:
                        Text("Lịch sử đặt sân", style: TextStyle(fontSize: 16)))
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [BookedPitch(), BookingHistory()],
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: FooterMenu(1),
        ));
  }
}

class BookedPitch extends StatefulWidget {
  const BookedPitch({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookedPitchState();
}

class _BookedPitchState extends State<BookedPitch> {
  late Future<List<BookingModel>> listBooked;

  @override
  initState() {
    super.initState();
    listBooked = MyBookingViewModel.getListBookedByCustomerID();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<BookingModel>>(
          future: listBooked,
          builder: (BuildContext context,
              AsyncSnapshot<List<BookingModel>> snapshot) {
            List<Widget> children = [];
            BookingModel data;
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.length; i++) {
                data = snapshot.data!.elementAt(i);
                children.add(BookedItem(
                    data.subPitchType,
                    data.timeStart,
                    data.dateBooking,
                    data.subPitchImageUrl,
                    data.pitchName,
                    data.address,
                    data.subPitchName,
                    data.price,
                    BookedBottomPart(data.id)));
              }
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Chờ chút xíu...'),
                )
              ];
            }
            return Column(children: children);
          }),
    );
  }
}

class BookedItem extends StatefulWidget {
  var type, time, date, img, name, address, price, pitchName, bottomPart;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address,
      this.pitchName, this.price, this.bottomPart,
      {Key? key})
      : super(key: key);

  @override
  State<BookedItem> createState() => _BookedItemState();
}

class _BookedItemState extends State<BookedItem> {
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(widget.type,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(widget.time, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 20),
              Text(widget.date, style: const TextStyle(color: Colors.grey))
            ])
          ]),
          GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/checkLocation'),
              child: Container(
                  child: Row(
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
                        // const SizedBox(height: 10),
                        Text(widget.pitchName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.address, maxLines: 3),
                        const SizedBox(height: 10),
                        Text(widget.price + " - Tiền mặt"),
                      ],
                    ),
                  ),
                ],
              ))),
          const Divider(color: Colors.black),
          widget.bottomPart
        ],
      ),
    );
  }
}

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  late Future<List<BookingModel>> listBookingHistory;

  @override
  void initState() {
    super.initState();
    listBookingHistory = MyBookingViewModel.getListBookingHistoryByCustomerID();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<BookingModel>>(
          future: listBookingHistory,
          builder: (BuildContext context,
              AsyncSnapshot<List<BookingModel>> snapshot) {
            List<Widget> children = [];
            BookingModel data;
            var bottomPart;
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.length; i++) {
                data = snapshot.data!.elementAt(i);
                bottomPart = data.status == 'Cancel'
                    ? CancelBottomPart(data.id)
                    : CompleteBottomPart(data.id);
                children.add(BookedItem(
                    data.subPitchType,
                    data.timeStart,
                    data.dateBooking,
                    data.subPitchImageUrl,
                    data.pitchName,
                    data.address,
                    data.subPitchName,
                    data.price,
                    bottomPart));
              }
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Chờ chút xíu...'),
                )
              ];
            }
            return Column(children: children);
          }),
      // child: Column(
      //   children: [
      //     BookedItem(
      //         "Sân 5",
      //         "",
      //         "10/10/2021",
      //         "assets/images/img1.jpg",
      //         "Khu Liên Hiệp Thể Thao TNG",
      //         "27/311/D To 85 Thống Nhất, Phường 15, Gò Vấp, Thành phố Hồ Chí Minh.",
      //         "",
      //         "",
      //         CancelBottomPart()),
      //     BookedItem(
      //         "Sân 7",
      //         "",
      //         "10/11/2021",
      //         "assets/images/img2.jpg",
      //         "Sân bóng Hoàng Phú",
      //         "449 Đ. Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh.",
      //         "",
      //         "",
      //         CompleteBottomPart())
      //   ],
      // ),
    );
  }
}

class BookedBottomPart extends StatefulWidget {
  BookedBottomPart(this.bookingID, {Key? key}) : super(key: key);
  var bookingID;

  @override
  State<BookedBottomPart> createState() => _BookedBottomPartState();

  static _BookedBottomPartState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BookedBottomPartState>();
}

class _BookedBottomPartState extends State<BookedBottomPart> {
  var reason = '';
  var isCancel;
  TextEditingController controller = TextEditingController();
  set string(String value) => setState(() => reason = value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Đã đặt",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        FlatButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Hủy đặt sân'),
                content: CancelForm(controller,
                    callback: (val) => setState(() => reason = val)),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      isCancel = await MyBookingViewModel.cancelBooking(
                          widget.bookingID,
                          (reason != 'Lý do khác'
                              ? reason
                              : controller.text.length > 0
                                  ? controller.text
                                  : reason));
                      if (isCancel) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Hủy thành công'),
                            content: Text('Hủy thành công!!!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(
                                        '/screen.home_screen.calendar_today'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        print(isCancel);
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child:
              const Text("Hủy", style: TextStyle(fontWeight: FontWeight.bold)),
          color: Colors.red,
          textColor: Colors.white,
        )
      ],
    );
  }
}

typedef void StringCallback(String val);

class CancelForm extends StatefulWidget {
  CancelForm(this.controller, {required this.callback, Key? key})
      : super(key: key);
  StringCallback callback;
  TextEditingController controller;

  @override
  _CancelFormState createState() => _CancelFormState();
}

class _CancelFormState extends State<CancelForm> {
  var selected = MyBookingViewModel.reasonList.elementAt(0);
  var isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: SingleChildScrollView(child: Column(children: getListReason())));
  }

  List<Widget> getListReason() {
    List<Widget> reasonItemList = [];

    for (int i = 0; i < MyBookingViewModel.reasonList.length; i++) {
      reasonItemList.add(ListTile(
          title: Text(MyBookingViewModel.reasonList.elementAt(i)),
          leading: Radio(
              value: MyBookingViewModel.reasonList.elementAt(i),
              groupValue: selected,
              onChanged: (value) {
                setState(() {
                  selected = value.toString();
                  widget.callback(selected);
                  if ('Lý do khác' == value.toString()) {
                    isVisibility = true;
                  } else {
                    isVisibility = false;
                  }
                });
              })));
    }
    reasonItemList.add(Visibility(
        visible: isVisibility,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Lý do bạn hủy sân',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            border: OutlineInputBorder(),
          ),
          maxLines: 8,
          maxLength: 500,
        )));
    return reasonItemList;
  }
}

class CompleteBottomPart extends StatelessWidget {
  CompleteBottomPart(this.bookingID, {Key? key}) : super(key: key);
  var bookingID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/complete.png"),
          // width: 100,
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ratePitch');
                },
                child: const Text("Đánh giá",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.green, width: 2))),
            const SizedBox(width: 20),
            FlatButton(
              onPressed: () {},
              child: const Text("Đặt lại",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class CancelBottomPart extends StatelessWidget {
  CancelBottomPart(this.bookingID, {Key? key}) : super(key: key);
  var bookingID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/cancel.png"),
          // width: 100,
          height: 50,
        ),
        FlatButton(
          onPressed: () {},
          child: const Text("Đặt lại",
              style: TextStyle(fontWeight: FontWeight.bold)),
          color: Colors.green,
          textColor: Colors.white,
        )
      ],
    );
  }
}
