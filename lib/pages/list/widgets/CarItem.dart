import 'package:flutter/material.dart';
import 'package:guazi_app/models/CarInfo.dart';

class CarItem extends StatelessWidget {
  final CarBasicInfo item;
  final Function callback;
  CarItem({this.item, this.callback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(item.id),
      onTap: (){callback(item.id);},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            // Image.network(item.pic,width: 100,fit: BoxFit.fitWidth,),
            Column(
              children: <Widget>[Text(item.title)],
            )
          ],
        ),
      ),
    );
  }
}
