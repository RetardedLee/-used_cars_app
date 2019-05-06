import "package:flutter/material.dart";
import 'package:guazi_app/models/CityPosition.dart';

class PositionPanel extends StatelessWidget {
  final List<CityLabel> list;
  final Function onSelect;
  final double height;
  final VoidCallback selectCity;
  final City currentCity;
  PositionPanel({this.list, this.onSelect, this.height, this.selectCity,this.currentCity});

  Widget _buildItem(CityLabel item, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xfff5f7fa)),
            child: Row(children: [
              Text(
                item.label,
                style: TextStyle(color: Color(0xff8f96a0)),
              ),
            ]),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _buildBelongList(item.cityList),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBelongList(List<City> list) {
    return list
        .map((City city) => Container(
              height: 40,
              width: 80,
              padding: EdgeInsets.all(0),
              child: GestureDetector(
                child: Center(
                  child: Text(
                    city.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff303741)),
                  ),
                ),
                onTap: () {
                  onSelect(city);
                },
              ),
            ))
        .toList();
  }

  List<Widget> _buildAllCity(BuildContext context) {
    return list
        .map((CityLabel item) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[_buildItem(item, context)],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.addAll(_buildAllCity(context));
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.black12)),
      child: ListView(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        children: children,
      ),
      width: MediaQuery.of(context).size.width - 30,
      height: height,
    );
  }
}
