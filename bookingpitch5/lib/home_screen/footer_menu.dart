import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FooterMenu extends StatelessWidget {
  int selectedPage;

  FooterMenu(this.selectedPage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedPage == 0 ? Colors.green : null,
            ),
            title: Text("Trang chủ")),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.my_library_books,
        //         color: selectedPage == 1 ? Colors.green : null),
        //     title: Text("Quản lý sân banh")),
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check), title: Text("Lịch đặt các sân")),
        BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.notifications),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '2',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            title: Text('Thông báo')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), title: Text("Tài khoản"))
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed('/mainScreenHost');
            break;
          // case 1:
          //   Navigator.of(context)
          //       .pushNamed('/screen.home_screen.calendar_today');
          //   break;
          case 1:
            Navigator.of(context).pushNamed('/calendar');
            break;
          case 2:
            Navigator.of(context).pushNamed('/notificationPitch');
            break;
          case 3:
            Navigator.of(context).pushNamed('/accountHost');
            break;
        }
      },
      currentIndex: selectedPage,
      selectedItemColor: Colors.green,
    ));
  }
}
