import 'package:flutter/material.dart';

class BottomBar{
  int iconSize;
  BottomNavigationBarType type;
  List<BottomBarItem> items;
  BottomBar({this.iconSize,this.type,this.items});
}

class BottomBarItem{
  Icon icon;
  String title;
  BottomBarItem({this.icon,this.title});
}