import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guazi_app/models/CityPosition.dart';

class GuaziAppBar extends StatelessWidget {
  final double height;
  final double elevation; //阴影
  final Widget leading;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData prefixIcon;
  final VoidCallback onEditingComplete;
  final Color fontColor;
  final Color fillColor;
  final Color bgColor;
  final bool showShdow;
  final double opacity;
  final VoidCallback onPostioned;
  final VoidCallback onTextFieldClick;
  final bool slided;
  final bool showInput;
  final City currentCity;
  GuaziAppBar(
      {Key key,
      this.opacity = 1,
      this.showShdow = false,
      this.fontColor = Colors.white,
      this.fillColor = Colors.white,
      this.bgColor = const Color.fromRGBO(255, 255, 255, 0),
      this.height: 46.0,
      this.elevation: 0.5,
      this.leading,
      this.hintText: '请输入关键词',
      this.focusNode,
      this.controller,
      this.onEditingComplete,
      this.prefixIcon: Icons.search,
      this.onPostioned,
      this.onTextFieldClick,
      this.slided = false,
      this.showInput=true,
      this.currentCity
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("---------------------------");
    print(currentCity.name);
    return Opacity(
      opacity: opacity,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Container(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          child: Text(
                            currentCity.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: fontColor,
                            ),
                          ),
                          
                        )),
                    Icon(
                      !slided
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: fontColor,
                    )
                  ],
                ),
                onTap: onPostioned,
              ),
            ),
            Expanded(
                flex: 15,
                child: Container(
                  height: 32,
                  child: showInput?TextField(
                    enabled: false,
                    onTap: () {
                      onTextFieldClick();
                    },
                    controller: controller,
                    cursorWidth: 1,
                    scrollPadding: EdgeInsets.all(0),
                    cursorColor: Colors.black26,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      hintText: hintText,
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black45,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                      filled: true,
                      fillColor: fillColor,
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textInputAction: TextInputAction.done,
                  ):null,
                )),
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.info,
                    color: fontColor,
                  )),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: bgColor,
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 15),
        height: 90,
      ),
    );
  }
}
