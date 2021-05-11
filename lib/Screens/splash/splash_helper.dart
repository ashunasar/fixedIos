

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kkconferences/api/firebase_clerk_api.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/amenitie_model.dart';
import 'package:kkconferences/model/confress_model.dart';
import 'package:kkconferences/model/room_images.dart';
import 'package:kkconferences/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashHelper{

  List rooms = null; // fixme add here

  initRoomInfo(BuildContext context) async{
    if (rooms != null) {
      return;
    }

    QuerySnapshot snapshot=   await FirebaseMemberApi().getRoomInfo("680380e8-c759-4b7a-9a20-a5bf4bb1079b"); //room 1 info
    QuerySnapshot snapshot2=   await FirebaseMemberApi().getRoomInfo("1c12c8cb-ac0a-48c5-8991-c1ed87a71fbf"); //room 1 info
    RoomInfo roomInfoRawDetails=  RoomInfo.fromJson(snapshot.docs.first.data());
    RoomInfo roomInfoRawDetails2=  RoomInfo.fromJson(snapshot2.docs.first.data());


    rooms = [];
    rooms.add(RoomInfo(
        roomNo: roomInfoRawDetails.roomNo,
        name: roomInfoRawDetails.name,
        address: "Loprem Ipsum Address",
        price: roomInfoRawDetails.price,
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
        roomNo:roomInfoRawDetails2.roomNo,
        name: roomInfoRawDetails2.name,
        address: "Loprem Ipsum Address 2",
        price: roomInfoRawDetails2.price,
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

    final provider=Provider.of<HomeScreenProvider>(context,listen: false);
    provider.rooms=rooms;

  }
  
  
}