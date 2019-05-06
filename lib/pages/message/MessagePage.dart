import 'package:flutter/material.dart';
class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}


class _MessagePageState extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    
    return Container(child: Text('消息'),);
  }
}