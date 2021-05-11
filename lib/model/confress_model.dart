import 'package:kkconferences/model/room_images.dart';

import 'amenitie_model.dart';
// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

class RoomInfo {
  String leadImage;
  int price;
  String address;
  String name;
  String roomNo;
  List<RoomImages> room_images; //fixme not found
  List<Amenitie> amenities; //  fixme not found
  String roomUniqueId; // fixme not found

  String description;
  RoomInfo({this.leadImage, this.price, this.address,   this.roomUniqueId, this.name, this.roomNo,this.room_images,this.description,this.amenities,});

  RoomInfo copyWith({
    String roomUniqueId,
    String leadImage,
    int price,
    String address,
    String name,
    String roomNo,
    String description,
  }) =>
      RoomInfo(
        roomUniqueId: roomUniqueId ?? this.roomUniqueId,
        leadImage: leadImage ?? this.leadImage,
        price: price ?? this.price,
        address: address ?? this.address,
        name: name ?? this.name,
        roomNo: roomNo ?? this.roomNo,
        description: description ?? this.description,
      );

  factory RoomInfo.fromJson(Map<String, dynamic> json) => RoomInfo(
    roomUniqueId: json["room_unique_id"],
    leadImage: json["leadImage"],
    price: json["price"],
    address: json["address"],
    name: json["name"],
    roomNo: json["roomNo"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "room_unique_id": roomUniqueId,
    "leadImage": leadImage,
    "price": price,
    "address": address,
    "name": name,
    "roomNo": roomNo,
    "description": description,
  };














}






