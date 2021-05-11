import 'package:flutter/material.dart';

class Amenitie {
  String name;
  String imageUrl;
  Color color;
  Amenitie({this.name, this.imageUrl,this.color});

  Amenitie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
