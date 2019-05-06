import 'package:flutter/material.dart';
import 'package:guazi_app/models/Car.dart';

class RecommendList extends StatelessWidget {
  final PageCar data;
  RecommendList({this.data});

  Widget _buildItem(CarItem item, double width) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200], width: 0.5),
          boxShadow: [
            BoxShadow(
                color: Color(0xffe5e5e5),
                offset: Offset(5.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 2.0),
            BoxShadow(color: Color(0xffe5e5e5), offset: Offset(1.0, 1.0)),
            BoxShadow(color: Color(0xffe5e5e5))
          ],
        ),
        width: width / 2 - 20,
        child: Column(
          children: <Widget>[
            Image.network(
              item.albumnail,
              fit: BoxFit.contain,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildList(List<CarItem> list, double width) {
    return list.map((CarItem item) => _buildItem(item, width)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (data.code == 0) {
      children.add(Container(
        child: Text("正在加载"),
      ));
    } else if (data.code == 1) {
      children.add(Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          "为您推荐",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
      ));
      children.add(Wrap(
        runSpacing: 15,
        // alignment: WrapAlignment.spaceAround,
        spacing: 15,
        children: _buildList(data.item, MediaQuery.of(context).size.width),
      ));
    }
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[300]))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
