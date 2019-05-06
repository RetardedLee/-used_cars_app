import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guazi_app/components/BottomBar.dart';
import 'package:guazi_app/models/CityPosition.dart';
import 'package:guazi_app/models/GlobalData.dart';
import 'package:guazi_app/pages/buy/BuyPage.dart';
import 'package:guazi_app/pages/home/HomePage.dart';
import 'package:guazi_app/pages/message/MessagePage.dart';
import 'package:guazi_app/pages/sale/SalePage.dart';
import 'package:guazi_app/pages/user/UserPage.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _index;
  GlobalData global;
  final List<Widget> _pageList = List();



  _onTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    City currentCity=City.fromJson({
             "id": "12",
             "city_code": "0",
             "standard_code": "110000",
             "script_index": "0",
             "agency_code": "\u4eacA~Y",
             "parent_id": "1",
             "name": "\u5317\u4eac",
             "domain": "bj",
             "database": "beijing",
             "pinyin": "beijing",
             "location": "b116.407413,39.904214",
             "region_id": "8",
             "area_code": "010",
             "nc_region_id": "100",
             "type": "2"
         });
    global=GlobalData(currentCity: currentCity);
    _pageList
      ..add(HomePage(currentCity: global.currentCity,onSelectCity: _onSelectCity,))
      ..add(BuyPage())
      ..add(SalePage())
      ..add(MessagePage())
      ..add(UserPage());
    super.initState();
    _index = 0;
  }

  _onSelectCity(City city){
     global.currentCity=city;
     print(global.currentCity.name);
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return MaterialApp(
      title: 'guazi',
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        primary: false,
        bottomNavigationBar: BottomBar(
          currentIndex: _index,
          onTap: _onTap,
        ),
        body: Container(child: _pageList[_index]),
      ),
    );
  }
}
