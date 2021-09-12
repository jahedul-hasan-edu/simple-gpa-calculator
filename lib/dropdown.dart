import 'package:flutter/material.dart';

class dropDown extends StatefulWidget {
  final Function callback;
  const dropDown({Key? key, required this.callback}) : super(key: key);

  @override
  _dropDownState createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  String _selectedValue = 'Choose one';
  List<String> _items = ['Choose one', '3.0', '1.5'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color: Color(0xffe1e4e8)),
      padding: EdgeInsets.only(left: 10, right: 5),
      child: DropdownButton<String>(
          value: _selectedValue,
          items: _items.map((String val) {
            return new DropdownMenuItem<String>(
              value: val,
              child: new Text(val),
            );
          }).toList(),
          icon: Icon(Icons.arrow_downward),
          underline: SizedBox(
            height: 50,
          ),
          hint: Text("Choose one"),
          onChanged: (newVal) {
            this.setState(() {
              _selectedValue = newVal!;
            });
            widget.callback(_selectedValue);
          }),
    );
  }
}
