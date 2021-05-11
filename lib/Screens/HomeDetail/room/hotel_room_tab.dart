import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/HomeDetail/room/room_item.dart';
import 'package:kkconferences/model/confress_model.dart';
import 'package:kkconferences/model/room_images.dart';


class HotelRoomTab extends StatelessWidget {
  final List<RoomImages> rooms;

  const HotelRoomTab({
    Key key,
    this.rooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) => RoomItem(room: rooms[index]),
    );
  }
}
