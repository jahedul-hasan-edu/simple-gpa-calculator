import 'package:flutter/material.dart';

class textInput extends StatelessWidget {
  final String title;
  final TextEditingController txtController;
  const textInput({Key? key, required this.title, required this.txtController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: txtController,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(),
              hintText: title),
          style: TextStyle(fontSize: 21),
        ),
      )),
    );
  }
}
