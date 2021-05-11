


import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';

class Chips extends StatelessWidget {
  String text;

  Chips({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        child: Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
              color: main_color,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Text(
                "$text",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
