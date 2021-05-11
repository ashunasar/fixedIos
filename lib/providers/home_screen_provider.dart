import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/amenitie_model.dart';
import 'package:kkconferences/model/confress_model.dart';
import 'package:kkconferences/model/room_images.dart';

class HomeScreenProvider extends ChangeNotifier {
  List rooms = null; // fixme add here

  init() {
    if (rooms != null) {
      return;
    }
    rooms = [];
    rooms.add(RoomInfo(
        roomNo: "1",
        name: "Room 1",
        address: "Loprem Ipsum Address",
        price: 200,
        leadImage: "assets/rooma1.jpeg",
        description: "${room1desc}",
        room_images: [
          RoomImages(imageUrl: "assets/rooma2.jpeg", name: "Image 1"),
          RoomImages(imageUrl: "assets/rooma3.jpeg", name: "Image 2"),
          RoomImages(imageUrl: "assets/rooma4.jpeg", name: "Image 3"),
        ],
        amenities: [
          Amenitie(
              name: "WIFI", imageUrl: "assets/wifi.svg", color: main_color),
          Amenitie(name: "AC", imageUrl: "assets/ac.svg", color: main_color),
          Amenitie(name: "PARKING", imageUrl: "assets/parking.svg", color: main_color)
        ]));

    rooms.add(RoomInfo(
        roomNo: "2",
        name: "Room 2",
        address: "Loprem Ipsum Address 2",
        price: 400,
        leadImage: "assets/roomc1.jpeg",
        description: "${room2desc}",
        room_images: [
          RoomImages(imageUrl: "assets/roomc2.jpeg", name: "Image a1"),
          RoomImages(imageUrl: "assets/roomc3.jpeg", name: "Image a2"),
          RoomImages(imageUrl: "assets/roomc4.jpeg", name: "Image a3"),
        ],
        amenities: [
          Amenitie(
              name: "WIFI", imageUrl: "assets/wifi.svg", color: main_color),
          Amenitie(name: "AC", imageUrl: "assets/ac.svg", color: main_color),
          Amenitie(name: "PRINTER", imageUrl: "assets/printer.svg", color: main_color),
          Amenitie(name: "PARKING", imageUrl: "assets/parking.svg", color: main_color),
        ]));
  }
}
