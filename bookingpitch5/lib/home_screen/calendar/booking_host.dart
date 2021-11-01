import 'package:bookingpitch5/home_screen/footer_menu.dart';
import 'package:bookingpitch5/models/booking_host/booking_host_model.dart';
import 'package:bookingpitch5/view_models/booking_host_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BookingHost extends StatelessWidget {
  const BookingHost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch đặt sân",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          BookedPitch(),
          // Text("Lịch sử đặt sân")
        ],
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: FooterMenuHost(1),
    );
  }
}

class BookedPitch extends StatefulWidget {
  const BookedPitch({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookedPitchState();
}

class _BookedPitchState extends State<BookedPitch> {

  late Future<List<BookingHostModel>> listBooked;

  @override
  initState() {
    super.initState();
    listBooked = BookingHostViewModel.getListBookedByHostID();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<BookingHostModel>>(
          future: listBooked,
          builder: (BuildContext context,
              AsyncSnapshot<List<BookingHostModel>> snapshot) {
            List<Widget> children = [];
            BookingHostModel data;
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.length; i++) {
                data = snapshot.data!.elementAt(i);
                children.add(BookedItem(
                    data.id,
                    data.customerName,
                    data.pitchName,
                    data.subPitchName,
                    data.subPitchType,
                    data.timeStart,
                    data.timeEnd,
                    data.dateBooking,
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
              children = <Widget>[
                Padding(
                  padding: EdgeInsets.all(22),
                  child: SizedBox(
                    child: new CircularPercentIndicator(
                      radius: 120.0,
                      animation: true,
                      lineWidth: 15.0,
                      animationDuration: 3000,
                      percent: 1,
                      center: new Icon(
                        Icons.sports_soccer_rounded,
                        size: 50.0,
                        color: Colors.black,
                      ),
                      footer: new Text('Server lag vãi lồn...', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      backgroundColor: Colors.grey[700],
                      progressColor: Colors.green[500],
                    ),                
                  ),
                ),
              ];
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children
              );
          }),
    );
  }

  


}


class BookedItem extends StatefulWidget {
  var price,
      timeStart,
      timeEnd,
      customer_name,
      datebooking,
      sonPitch,
      pitchName,
      typePitch,
      id,
      bottomPart;

  BookedItem(this.id, this.customer_name, this.pitchName, this.sonPitch, this.typePitch, this.timeStart, this.timeEnd, 
      this.datebooking, this.price, this.bottomPart,
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
            Text(widget.customer_name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
           
          ]),
          Container(
              child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/avatar_booking_host.png'),
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
                    Row(children: [
                      Text(
                        "Tên sân: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.pitchName),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "Sân: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.sonPitch),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "Thể loại sân: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.typePitch),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "Giờ: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.timeStart + '-' + widget.timeEnd),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "Ngày đặt sân: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.datebooking),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "Tiền mặt: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.price),
                    ])
                  ],
                ),
              ),
            ],
          )),
          const Divider(color: Colors.black),
          widget.bottomPart
        ],
      ),
    );
  }
}

class BookedBottomPart extends StatefulWidget {
  BookedBottomPart(this.bookingID, {Key? key}) : super(key: key);
  var bookingID;

  

  @override
  State<BookedBottomPart> createState() => _BookedBottomPartState();
}

class _BookedBottomPartState extends State<BookedBottomPart> {

  late List<BookingHostModel> listBookingHost;
  var reason = BookingHostViewModel.reasonList.elementAt(0);
  var isCancel;
  TextEditingController controller = TextEditingController();
  set string(String value) => setState(() => reason = value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("",
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
                      isCancel = await BookingHostViewModel.cancelBooking(
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
                                onPressed: () => {
                                   Navigator.of(context)
                                    .pushNamed(
                                        '/booking_host')
                                },
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
  var selected = BookingHostViewModel.reasonList.elementAt(0);
  var isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: SingleChildScrollView(child: Column(children: getListReason())));
  }

  List<Widget> getListReason() {
    List<Widget> reasonItemList = [];

    for (int i = 0; i < BookingHostViewModel.reasonList.length; i++) {
      reasonItemList.add(ListTile(
          title: Text(BookingHostViewModel.reasonList.elementAt(i)),
          leading: Radio(
              value: BookingHostViewModel.reasonList.elementAt(i),
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
  const CompleteBottomPart({Key? key}) : super(key: key);

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

