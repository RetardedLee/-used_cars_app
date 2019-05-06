import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:guazi_app/components/AppBar.dart';
import 'package:guazi_app/components/PositionPanel.dart';
import 'package:guazi_app/config/Config.dart';
import 'package:guazi_app/models/Car.dart';
import 'package:guazi_app/models/CityPosition.dart';
import 'package:guazi_app/pages/home/widgets/NavView.dart';
import 'package:guazi_app/pages/home/widgets/PriceView.dart';
import 'package:guazi_app/pages/home/widgets/RecList.dart';
import 'package:guazi_app/pages/home/widgets/RecommendList.dart';

class HomePage extends StatefulWidget {
  final City currentCity;
  final Function onSelectCity;
  HomePage({this.currentCity, this.onSelectCity});
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  AnimationController heightAnimateController;
  Animation<double> heightTween;
  Color bgColor;
  Color fontColor;
  Color fillColor;
  bool showShadow;
  double opacity;
  bool showMask;
  bool slided;
  bool showInput;
  City currentCity;
  bool pulled;
  bool pushed;
  Timer timer;
  PageCar carData = PageCar();
  @override
  initState() {
    super.initState();
    // _scrollController.addListener(() {
    //   _pullAndPush(_scrollController);
    //   _onScroll(_scrollController.offset);
    // });
    heightAnimateController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    heightTween =
        Tween<double>(begin: 0.0, end: 450.0).animate(heightAnimateController)
          ..addListener(() {
            setState(() {});
          });
    currentCity = widget.currentCity;
    bgColor = Color.fromRGBO(255, 255, 255, 0);
    fillColor = Colors.white;
    fontColor = Colors.white;
    showShadow = false;
    showMask = false;
    slided = false;
    opacity = 1;
    showInput = true;
    pulled = false;
    pushed = false;
    _lodaData();
  }

  _pullAndPush(ScrollController controller) {
    double min = controller.position.minScrollExtent;
    double max = controller.position.maxScrollExtent;
    double current = controller.position.pixels;
    if (!pulled && !pushed) {
      if (current < min) {
        if (current < -50) {
          pulled = true;
          timer = Timer(Duration(milliseconds: 2000), () {
            pulled = false;
          });
          //_lodaData();
        }
      } else if (current > max) {
        print("到底");
      }
    }
  }

  _lodaData() {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("assets/cars.json");
    loadString.then((String result) {
      // pulled = false;
      carData = PageCar.fromJson(jsonDecode(result));

      setState(() {});
    });
  }

  Widget _buildIndicatorItem(Color color, Color bdColor) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: bdColor)),
    );
  }

  _onSelectCity(City city) {
    currentCity = city;
    showMask = false;
    showInput = true;
    heightAnimateController.reverse();
    widget.onSelectCity(city);
  }

  bool _onScroll(double offset) {
    double pixel = offset;
    if (pixel > 50) {
      fillColor = Color(0xfff4f4f4);
      fontColor = Color(0xff303741);
      showShadow = true;
      bgColor = Color.fromRGBO(255, 255, 255, 1);
    } else {
      fillColor = Colors.white;
      fontColor = Colors.white;
    }
    if (pixel >= 0 && pixel <= 80) {
      bgColor = Color.fromRGBO(255, 255, 255, pixel / 80);
    }
    if (pixel < 0) {
      opacity = 1 - (-pixel / 30);
    } else {
      opacity = 1;
    }
    if (opacity > 1.0) {
      opacity = 1.0;
    } else if (opacity < 0) {
      opacity = 0;
    }
    setState(() {});
    return true;
  }

  /// 点击点位
  void _onPostioned() {
    if (heightAnimateController.isCompleted) {
      showMask = false;
      slided = false;
      showInput = true;
      heightAnimateController.reverse();
    } else {
      slided = true;
      showMask = true;
      showInput = false;
      heightAnimateController.forward();
    }
  }

  List<Widget> _buildIconNav() {
    List<Widget> containers = List();
    containers.add(NavView(
      list: navItem.sublist(0, 10),
    ));
    containers.add(NavView(
      list: navItem.sublist(10),
    ));
    return containers;
  }

  List<Widget> _buildBanner() {
    print(MediaQuery.of(context).size.width);
    return homeBanners
        .map((String item) => Image(
              fit: BoxFit.fitWidth,
              image: NetworkImage(item),
              width: MediaQuery.of(context).size.width,
            ))
        .toList();
  }

  Widget _buildIndiator(BuildContext context, Widget indicator) {
    Widget container = Container(
      height: 20.0,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          new Align(
            alignment: Alignment.center,
            child: indicator,
          ),
        ],
      ),
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: container,
    );
  }

  _dragStart(DragStartDetails detail){
      print(_scrollController.position.pixels);
  }

  _dragUpdate(DragUpdateDetails detail){
    print(_scrollController.position.pixels);
  }

  _dragDown(DragDownDetails detail){
     print(_scrollController.position.pixels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: GuaziAppBar(),
      body: Container(
        color: Colors.grey[200],
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            /// 上拉刷新
            Container(
              child: pulled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage("assets/images/loading.gif"),
                            height: 40,
                            width: 100,
                            fit: BoxFit.fitWidth)
                      ],
                    )
                  : null,
            ),
            GestureDetector(
              onVerticalDragDown: _dragDown,
                onHorizontalDragUpdate: _dragUpdate,
                onHorizontalDragStart: _dragStart,
                // onHorizontalDragEnd: _dragEnd,
                child: ListView(
          
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                /// 轮播
                Container(
                  child: BannerView(
                    _buildBanner(),
                    intervalDuration: Duration(milliseconds: 3500),
                    indicatorSelected: _buildIndicatorItem(
                        Color(0xff22a038), Color(0xff22a038)),
                    indicatorNormal:
                        _buildIndicatorItem(Colors.white, Colors.grey[300]),
                    indicatorBuilder: _buildIndiator,
                    log: false,
                  ),
                  height: 160,
                ),

                /// 导航图标
                Container(
                  color: Colors.white,
                  height: 170,
                  child: BannerView(
                    _buildIconNav(),
                    autoRolling: false,
                    indicatorSelected: _buildIndicatorItem(
                        Color(0xff22a038), Color(0xff22a038)),
                    indicatorNormal:
                        _buildIndicatorItem(Colors.white, Colors.grey[300]),
                    indicatorBuilder: _buildIndiator,
                    log: false,
                  ),
                ),

                /// 快速选择
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.black12))),
                  child: PriceView(
                    list: hotTags,
                  ),
                ),

                /// 推荐主题
                Container(
                  color: Color(0xfff6fafd),
                  child: RecList(
                    list: recList,
                  ),
                ),

                /// 推荐列表
                RecommendList(
                  data: carData,
                )
              ],
            )),

            /// mask

            Positioned(
              child: Container(
                width: showMask ? MediaQuery.of(context).size.width : 0,
                height: showMask ? MediaQuery.of(context).size.height : 0,
                color: Colors.black26,
              ),
              top: 0,
              left: 0,
            ),

            /// 头部
            Positioned(
              child: GuaziAppBar(
                showInput: showInput,
                slided: slided,
                opacity: opacity,
                bgColor: bgColor,
                fontColor: fontColor,
                fillColor: fillColor,
                onPostioned: _onPostioned,
                currentCity: currentCity,
              ),
            ),

            /// 选择城市
            Positioned(
              top: 70,
              child: PositionPanel(
                currentCity: currentCity,
                list: citys.allCityList,
                onSelect: _onSelectCity,
              ),
              width: MediaQuery.of(context).size.width,
              height: heightTween.value,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
    _scrollController.dispose();
    heightAnimateController.dispose();
  }
}
