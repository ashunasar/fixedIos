

import 'dart:convert';

StaffModel staffModelFromJson(String str) => StaffModel.fromJson(json.decode(str));

String staffModelToJson(StaffModel data) => json.encode(data.toJson());

class StaffModel {
  StaffModel({
    this.name,
    this.phoneNumber,
    this.authority,
    this.email,
    this.password,
    this.staffid,
    this.usertype
  });

  String name;
  String usertype;
  String phoneNumber;
  String authority;
  String email;
  String password;
  String staffid;

  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
    name: json["name"],
    usertype: json["usertype"],
    phoneNumber: json["phone_number"],
    authority: json["authority"],
    email: json["email"],
    password: json["password"],
    staffid: json["staffid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "usertype": usertype,
    "phone_number": phoneNumber,
    "authority": authority,
    "email": email,
    "password": password,
    "staffid": staffid,
  };
}

class StaffResult {
  int status = 0;
  String msg;
  StaffModel staffModel;

  StaffResult({this.status, this.msg, this.staffModel});
}


