import 'package:flutter/material.dart';

class HotelPriceText extends StatelessWidget {
  final int price;

  const HotelPriceText({Key key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\₹' + price.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '/hr',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
