import 'package:flutter/material.dart';

class btnCommon extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double fontSize;
  final Function callback;
  const btnCommon(
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
          width: 90,
          height: 50,
          child: FlatButton(
            child: Row(
              children: [
                Icon(Icons.add),
                Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: fillColor != 0 ? Color(fillColor) : null,
            onPressed: () {
              callback(text);
            },
            textColor: Color(textColor),
          ),
        ));
  }
}
