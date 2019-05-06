import 'package:flutter/material.dart';
import 'package:guazi_app/models/NavIconItem.dart';

class NavView extends StatelessWidget {
  NavView({this.onTap, this.list});
  final Function onTap;
  final List<NavIconItem> list;

  Widget _buildItem(NavIconItem item, BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          children: <Widget>[
            Image(
              width: 40,
              image: AssetImage('assets/images/${item.icon}.png'),
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                item.title,
                style: TextStyle(color: Color(0xff303741), fontSize: 11),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        onTap(item);
      },
    );
  }

  Column _buildColumn(BuildContext context) {
    List<Widget> firstLine = List();
    List<Widget> secondLine = List();
    for (int i = 0; i < list.length; i++) {
      Widget item = _buildItem(list[i], context);

      if (i < 5) {
        firstLine.add(item);
      } else {
        secondLine.add(item);
      }
    }
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: firstLine,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: secondLine,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildColumn(context));
  }
}
