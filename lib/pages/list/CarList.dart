import 'package:flutter/material.dart';
import 'package:guazi_app/components/AppBar.dart';
import 'package:guazi_app/components/DropdownFilter.dart';
import 'package:guazi_app/components/EmptyView.dart';
import 'package:guazi_app/models/CarInfo.dart';
import 'package:guazi_app/pages/list/widgets/CarItem.dart';

List<DropdownFilterData> dropdownFilterData = [
  DropdownFilterData(
      label: "价格",
      value: "price",
      isItemWrap: false,
      items: <DropdownFilterItem>[
        DropdownFilterItem(label: "选项1", value: '1'),
        DropdownFilterItem(label: "选项2", value: '2'),
        DropdownFilterItem(label: "选项2", value: '2'),
        DropdownFilterItem(label: "选项2", value: '2')
      ]),
  DropdownFilterData(label: "价格", value: "price", items: <DropdownFilterItem>[
    DropdownFilterItem(label: "选项1", value: '1'),
    DropdownFilterItem(label: "选项2", value: '2'),
    DropdownFilterItem(label: "选项2", value: '2'),
    DropdownFilterItem(label: "选项2", value: '2')
  ]),
  DropdownFilterData(label: "价格", value: "price", items: <DropdownFilterItem>[
    DropdownFilterItem(label: "选项1", value: '1'),
    DropdownFilterItem(label: "选项2", value: '2'),
    DropdownFilterItem(label: "选项2", value: '2'),
    DropdownFilterItem(label: "选项2", value: '2')
  ])
];

class CarList extends StatefulWidget {
  CarList({Key key, this.carData}) : super(key: key);
  final CarBasicInfoWrapper carData;
  @override
  _CarListState createState() => _CarListState();
}

_chooseOption(DropdownFilterItem item, int index) {
  print(item);
}

class _CarListState extends State<CarList> {
  _callback(index) {
    print("顶级");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildList() {
      if (widget.carData.code == 1) {
        return widget.carData.data
            .map((CarBasicInfo info) => CarItem(
                  item: info,
                  callback: _callback,
                ))
            .toList();
      } else {
        return [
          EmptyView(
            child: Text("暂无数据"),
          )
        ];
      }
    }

    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Wrap(
          // mainAxisSize: MainAxisSize.min,
          children: [
            
             DropdownFilter(
                onSelect: _chooseOption,
                list: dropdownFilterData,
              ),
         
          
             Container(width: 100,height: 100,color: Colors.red,)
            
            // Expanded(
            //   child: Container(
            //     child: ListView(
            //       padding: EdgeInsets.all(0),
            //       children: _buildList(),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
