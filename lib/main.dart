import 'package:flutter/material.dart';
import 'package:gpacalculator/button.dart';
import 'package:gpacalculator/button2.dart';
import 'package:gpacalculator/dropdown.dart';
import 'package:gpacalculator/listView.dart';
import 'package:gpacalculator/textInput.dart';
import './model.dart';
import './universityGPA.dart';

void main() {
  runApp(gpa());
}

class gpa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String _appTitle = 'GPA Calculator';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: gpaSplash(title: _appTitle),
    );
  }
}

class gpaSplash extends StatefulWidget {
  final String title;
  gpaSplash({Key? key, required this.title}) : super(key: key);
  @override
  _gpaSplash createState() => _gpaSplash();
}

class _gpaSplash extends State<gpaSplash> {
  final String _appTitle = 'GPA Calculator';
  String selectedValue = '';
  late TextEditingController txtGradeController = new TextEditingController();
  List<MyModel> models = [];
  int _count = 0;
  double result = 0;
  void addAction(String txt) {
    setState(() {
      if (txtGradeController.text != "" && selectedValue != "") {
        models.add(new MyModel(
            id: ++_count,
            grade: txtGradeController.text,
            credit: double.parse(selectedValue)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please provide all data")));
      }
    });
  }

  void dropDownValueSet(String newVal) {
    setState(() {
      selectedValue = newVal;
    });
  }

  void valueChange(String? text) {
    setState(() {
      print(text);
    });
  }

  void calculateResult() {
    setState(() {
      result = 0;
      for (int i = 0; i < models.length; i++) {
        gpaZone g = gpaZone(zone: "EDU", grade: models[i].grade);
        result += g.getGpa();
      }
      result = result / models.length;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Congratulations! Your grade is " + result.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            textInput(
              title: "Grade",
              txtController: txtGradeController,
            ),
            dropDown(
              callback: dropDownValueSet,
            ),
            btnCommon(
              text: "Add",
              textColor: 0xffffffff,
              fillColor: 0xffd65120,
              fontSize: 15,
              callback: addAction,
            )
          ]),
          listView(listItem: models),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          calculateResult();
        },
        icon: Icon(Icons.settings),
        label: Text(" Calculate"),
      ),
    );
  }
}
