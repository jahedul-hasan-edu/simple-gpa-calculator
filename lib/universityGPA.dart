import 'package:flutter/cupertino.dart';

class gpaZone {
  String zone;
  String grade;
  gpaZone({required this.zone, required this.grade});

  double getGpa() {
    double ret = 0.0;
    if (zone == "EDU") {
      switch (grade) {
        case "A":
          ret = 4.0;
          break;

        case "A-":
          ret = 3.7;
          break;

        case "B+":
          ret = 3.3;
          break;

        case "B":
          ret = 3.0;
          break;

        case "C+":
          ret = 2.3;
          break;

        case "C":
          ret = 2.0;
          break;

        case "C-":
          ret = 1.7;
          break;

        case "D+":
          ret = 1.3;
          break;

        case "D":
          ret = 1.0;
          break;
        default:
          break;
      }
    }
    return ret;
  }
}
