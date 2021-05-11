
import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final double fontsize;

  const GreenButton({Key key, this.text, this.color,this.height,this.width,this.fontsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: main_color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontsize,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}