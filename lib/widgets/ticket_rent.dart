import 'package:flutter/material.dart';

class TicketRent extends StatelessWidget {
  final String title;
  final Color color;

  const TicketRent({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: Text(
          'FOR RENT',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class BuyNow extends StatelessWidget {
  final String title;
  final Color color;

  const BuyNow({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}




