import 'package:flutter/cupertino.dart';

class HomeRecList{

  int type;
  String title;
  Icon icon;
  List<Color> colors;
  List<HomeRecListItem> items;
  HomeRecList({this.title,this.icon,this.colors,this.items,this.type});
}


class HomeRecListItem{
  bool showTitle;
  String title;
  String subTitle;
  int type;
  String bgImg;
  String url;
  HomeRecListItem({this.title,this.subTitle,this.type,this.bgImg,this.url,this.showTitle=true});
}