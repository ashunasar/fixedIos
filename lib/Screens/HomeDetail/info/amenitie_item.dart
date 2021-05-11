
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkconferences/model/amenitie_model.dart';

class AmenitieItem extends StatelessWidget {
  final Amenitie amenitie;

  const AmenitieItem({Key key, this.amenitie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Card(
              color: amenitie.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  amenitie.imageUrl,
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
          Text(amenitie.name),
        ],
      ),
    );
  }
}
