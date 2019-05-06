import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuyPageState();
  }
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('购买'),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
