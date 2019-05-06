import 'package:flutter/material.dart';
import 'package:guazi_app/models/HotTagItem.dart';

class PriceView extends StatelessWidget {
  final List<HotTagItem> list;
  final Function onTap;
  PriceView({this.list, this.onTap});
  Widget _buildItem(HotTagItem item) {
    if (item.type == 'price') {
      return GestureDetector(
        child: Container(
          child: Text(item.tag),
        ),
      );
    } else {
      return GestureDetector(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/images/${item.icon}.png',
                width: 22,
                fit: BoxFit.fitWidth,
              ),
              Container(
                child: Text(item.tag),
                margin: EdgeInsets.only(left: 5),
              )
            ],
          ),
        ),
      );
    }
  }

  List<Widget> _buildList() {
    List<Widget> firstLine = [];
    List<Widget> secondLine = [];
    List<Widget> thirdLine = [];
    for (int i = 0; i < list.length; i++) {
      Widget item = Expanded(
          child: Center(
        child: _buildItem(list[i]),
      ));
      if (i < 4) {
        firstLine.add(item);
      } else if (i >= 4 && i < 8) {
        secondLine.add(item);
      } else {
        thirdLine.add(item);
      }
    }
    return [
      Row(
        children: firstLine,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: secondLine,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: thirdLine,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildList(),
    );
  }
}
