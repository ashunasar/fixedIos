class RoomImages {
  String imageUrl;
  String name;

  RoomImages({this.imageUrl, this.name});

  RoomImages.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    return data;
  }
}
