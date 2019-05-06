import 'package:flutter/material.dart';

class DropdownFilter extends StatefulWidget {
  /// 点击按钮
  final Function onExpandedChange;

  /// 所需数据

  final List<DropdownFilterData> list;

  /// 选中
  final Function(DropdownFilterItem item, int index) onSelect;

  /// 每个选项的样式
  final TextStyle itemStyle;

  /// 选中的样式
  final TextStyle activeStyle;

  DropdownFilter(
      {@required this.onSelect,
      this.onExpandedChange,
      @required this.list,
      this.itemStyle,
      this.activeStyle = const TextStyle(color: Colors.lightGreen)});
  _DropdownFilterState createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  int activeButtonIndex;
  int activeItemIndex;
  String activeItem;
  TextStyle itemStyle;
  TextStyle activeStyle;
  DropdownFilterData activeButton;
  _DropdownFilterState();

  /// 是否显示蒙层
  bool isMask = false;
  int curFilterIndex;
  List<DropdownFilterItem> items;
  @override
  void initState() {
    super.initState();
    activeButtonIndex = 0;
    activeButton = widget.list[0];
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = new Tween(begin: 0.0, end: 150.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget _buildContent() {
    Widget content;
    List<Widget> options = [];
    for (int i = 0; i < activeButton.items.length; i++) {
      DropdownFilterItem item = activeButton.items[i];
      options.add(
        GestureDetector(
          onTap: () {
            if (i != activeItemIndex) {
              widget.onSelect(item, i);
            }
          },
          child: Container(
            padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              item.label,
               textAlign:TextAlign.left,
              style:
                  activeItemIndex == i ? widget.activeStyle : widget.itemStyle,
            ),
          ),
        ),
      );
    }
    if (activeButton.isItemWrap) {
      content = Wrap(
        children: options,
      );
    } else {
      content = Column(
        children: options,
      );
    }
    return content;
  }

  _pressButton(String label, String valaue, int index) {
    if (index == activeButtonIndex) {
      if (animation.status == AnimationStatus.completed) {
        controller.reverse();
      } else {
        controller.forward();
      }
    } else {
      activeButton = widget.list[index];
      activeButtonIndex = index;
      if (animation.status == AnimationStatus.dismissed) {
        controller.forward();
      } else {
        setState(() {});
      }
    }
  }

  List<Widget> _buildButton() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.list.length; i++) {
      DropdownFilterData item = widget.list[i];
      buttons.add(FlatButton(
        child: Text(item.label ?? item.value),
        onPressed: () {
          _pressButton(item.value, item.label, i);
        },
      ));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child:Stack(
      // alignment: Alignment(1, 1),
      overflow: Overflow.visible,
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        Container(child:Row(children: _buildButton())),
        Positioned(
         top: 100,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: animation.value,
            color: Colors.blue,
            child: _buildContent(),
          ),
        )
      ],
    ));
  }
}

class DropdownFilterData {
  String label;
  String value;
  bool isItemWrap;
  List<DropdownFilterItem> items;
  DropdownFilterData(
      {this.label, this.value, this.isItemWrap = true, this.items});
}

class DropdownFilterItem {
  String label;
  String value;
  DropdownFilterItem({this.label, this.value});
}
