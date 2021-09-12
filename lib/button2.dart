import 'package:flutter/material.dart';

class btnCommon2 extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double fontSize;
  final Function callback;
  const btnCommon2(
      {Key? key,
      required this.text,
      this.fillColor = 0,
      required this.textColor,
      required this.fontSize,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: SizedBox(
          width: 130,
          height: 50,
          child: FlatButton(
            child: Row(
              children: [
                Icon(Icons.settings),
                Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: fillColor != 0 ? Color(fillColor) : null,
            onPressed: () {
              callback(text);
            },
            textColor: Color(textColor),
          ),
        ));
  }
}
