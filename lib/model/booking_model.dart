// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  BookingModel(
      {this.bookingDate,
      this.bookingStartTime,
      this.bookingStartduration,
      this.bookingEndTime,
      this.bookingEndduration,
      this.bookingId,
      this.bookingUserId,
      this.bookingStatus,
      this.iscancel,
      this.amount,
      this.createdon,
        this.applyCancelDate,
       this.roomno,
        this.paymentId,
        this.orderId,
        this.signature,
        this.approvePerson,
        this.roomname

      });

  String bookingDate;
  DateTime bookingStartTime;
  int bookingStartduration;
  DateTime bookingEndTime;
  int bookingEndduration;
  String bookingId;
  String bookingUserId;
  bool bookingStatus;
  bool iscancel;
  String amount;
  int createdon;
  String roomno;
  DateTime applyCancelDate;
  String paymentId;
  String orderId;
  String signature;
  String approvePerson;
  String roomname;


  factory BookingModel.fromRawJson(String str) =>
      BookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
      bookingDate: json["bookingDate"],
      bookingStartTime: DateTime.parse(json["bookingStartTime"]),
      bookingStartduration: json["bookingStartduration"],
      bookingEndTime: DateTime.parse(json["bookingEndTime"]),
      bookingEndduration: json["bookingEndduration"],
      bookingId: json["bookingId"],
    roomname: json["roomname"],
      bookingUserId: json["bookingUserId"],
      bookingStatus: json["bookingStatus"],
      iscancel: json["iscancel"],
      amount: json["amount"],
      createdon: json["createdon"],
      applyCancelDate: json["applyCancelDate"],
      roomno: json["roomno"],

      paymentId: json["paymentId"],
      orderId: json["orderId"],
      signature: json["signature"],
    approvePerson: json["approvePerson"],

  );

  Map<String, dynamic> toJson() => {
        "bookingDate": bookingDate,
        "bookingStartTime": bookingStartTime.toIso8601String(),
        "bookingStartduration": bookingStartduration,
        "bookingEndTime": bookingEndTime.toIso8601String(),
        "bookingEndduration": bookingEndduration,
        "bookingId": bookingId,
        "bookingUserId": bookingUserId,
        "bookingStatus": bookingStatus,
        "iscancel": iscancel,
        "amount": amount,
        "roomname": roomname,
        "createdon": createdon,
        "roomno": roomno,
        "applyCancelDate": applyCancelDate,

    "paymentId": paymentId,
    "orderId": orderId,
    "signature": signature,
    "approvePerson": approvePerson,
      };
}
