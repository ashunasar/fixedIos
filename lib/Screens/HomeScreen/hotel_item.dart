
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/HomeDetail/hotel_detail_page.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/confress_model.dart';
import 'package:kkconferences/widgets/hotel_price_text.dart';
import 'package:kkconferences/widgets/ticket_rent.dart';

class BookingRoomItem extends StatelessWidget {

 final RoomInfo room;
  const BookingRoomItem({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,  HotelDetailPage.classname,arguments: room);

      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                    tag: Key('key' + room.leadImage),
                    child: Image.asset(room.leadImage)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.only(top: 200),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TicketRent(
                            color: main_color,
                            title: 'FOR RENT',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HotelPriceText(price: room.price),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        room.name,
                        style: titleTextStyle,
                      ),
                      subtitle: Text(room.address),
                      trailing: Container(
                        decoration: BoxDecoration(
                            color: main_color, shape: BoxShape.circle),
                        child: Transform.rotate(
                          angle: 25 * 3.1416 / 180,
                          child: IconButton(
                            icon: Icon(Icons.navigation),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle titleTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
}
