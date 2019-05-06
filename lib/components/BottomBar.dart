import 'package:flutter/material.dart';
import 'package:guazi_app/car_icons.dart';

List<BottomNavigationBarItem> items = const [
  BottomNavigationBarItem(icon: Icon(CarIcon.home), title: Text('首页')),
  BottomNavigationBarItem(icon: Icon(CarIcon.cab), title: Text('买车')),
  BottomNavigationBarItem(icon: Icon(CarIcon.money), title: Text('卖车')),
  BottomNavigationBarItem(icon: Icon(CarIcon.comment), title: Text('消息')),
  BottomNavigationBarItem(icon: Icon(CarIcon.user), title: Text('我的')),
];

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  BottomBar({this.currentIndex, this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      iconSize: 20,
      // fixedColor: Colors.grey[300],
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: items,
    );
  }
}
