import 'package:flutter/material.dart';

import './model.dart';

class listView extends StatelessWidget {
  final List<MyModel> listItem;
  const listView({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Expanded(
          child: SizedBox(
        height: 300,
        child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listItem.length,
            itemBuilder: (BuildContext ctx, int index) {
              return new Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    listItem[index].grade +
                        "#" +
                        listItem[index].credit.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
