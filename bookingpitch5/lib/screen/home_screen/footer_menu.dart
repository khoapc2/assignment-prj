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
                  icon: Icon(Icons.home,
                    color: selectedPage == 0 ? Colors.green : null,),
                  title: Text("Trang chủ")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check,
                      color: selectedPage == 1 ? Colors.green : null),
                  title: Text("Sân đã đặt")),

              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), title: Text("Thông báo")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  title: Text("Tài khoản"))
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed('/');
                  break;
                case 1:
                  Navigator.of(context).pushNamed(
                      '/screen.home_screen.calendar_today');
                  break;
                case 2:
                  Navigator.of(context).pushNamed(
                      '/notification');
                  break;
                case 3:
                  Navigator.of(context).pushNamed('/account');
                  break;

              }
            },
          currentIndex: selectedPage,
          selectedItemColor: Colors.green,
        ));
  }
}