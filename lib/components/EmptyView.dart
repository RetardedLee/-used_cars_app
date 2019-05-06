import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final num height;
  final num width;
  final Widget child;
  final Color background;
  EmptyView(
      {this.height = 200,
      this.child,
      this.width,
      this.background = Colors.white});
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(color: background),
    );
  }
}
