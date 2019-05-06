import 'package:flutter/material.dart';
import 'package:guazi_app/models/HomeRecList.dart';

class RecList extends StatelessWidget {
  RecList({this.onTap, this.list});
  final Function onTap;
  final List<HomeRecList> list;

  Widget _buildTitle({String title, Icon icon, List<Color> colors}) {
    return Container(
      width: 150,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: icon,
            margin: EdgeInsets.only(right: 5, left: 10),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return list
        .map((HomeRecList item) => Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitle(
                    title: item.title, icon: item.icon, colors: item.colors),
                Container(child:_buildContent(type: item.type, list: item.items) ,margin: EdgeInsets.only(top: 10),padding: EdgeInsets.all(15),)
                
              ],
            )))
        .toList();
  }

  Widget _buildCard(HomeRecListItem item) {
    Widget tWidget = item.showTitle
        ? Column(
            children: <Widget>[
              Text(
                item.title,
                style: TextStyle(color: Color(0xff303741)),
              ),
              Text(
                item.subTitle,
                style: TextStyle(color: Color(0xffff7147), fontSize: 11),
              )
            ],
          )
        : Container(
            width: 0,
            height: 0,
          );
    Widget iWidget = Container(
      // height: 100,
      child: FadeInImage(
        placeholder: AssetImage(
          'assets/images/placeholder.png',
        ),
        image: NetworkImage(item.bgImg),
        fit: BoxFit.fitWidth,
        width: !item.showTitle && item.type == 1 ? 200 : 120,
      ),
    );
    if (item.type == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[tWidget, iWidget],
      );
    } else {
      return Container(
          decoration: BoxDecoration(
              color: Color(0xfff6fafd)),
          child: Column(
            children: <Widget>[tWidget, iWidget],
          ));
    }
  }

  Widget _buildContent({int type, List<HomeRecListItem> list}) {
    if (type == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: _buildCard(list[0]),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [_buildCard(list[1]), _buildCard(list[2])],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            child: _buildCard(list[0]),
            flex: 1,
          ),
          Expanded(
            child: _buildCard(list[1]),
            flex: 1,
          ),
          Expanded(
            child: _buildCard(list[2]),
            flex: 1,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xffeff2f6)))),
      padding: EdgeInsets.only(top: 15),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildList(),
    ));
  }
}
