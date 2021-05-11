import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

bool shouldButtonEnabled = true;

getUuid() {
  return Uuid().v4();
}

showMessage(GlobalKey<ScaffoldState> key, String msg) {
  key.currentState.showSnackBar(SnackBar(content: Text("" + msg)));
}

disableButton() {
  //step 2
  shouldButtonEnabled = false;
  Timer(Duration(seconds: 5), () => shouldButtonEnabled = true);
}

checkButtonEnable() {
  // step 1
  return shouldButtonEnabled;
}

String getFormattedTime(TimeOfDay picked) {
  String timeType = "";
  int hour;
  if (picked.hour > 12) {
    timeType = "PM";
  } else {
    timeType = "AM";
  }
  if (picked.hour > 12) {
    hour = picked.hour - 12;
  } else {
    hour = picked.hour;
  }
  String minuteText = "";
  if (picked.minute < 10) {
    minuteText = "0${picked.minute}";
  } else {
    minuteText = "${picked.minute}";
  }

  return " $hour:$minuteText $timeType";
}

String getFirebaseFormatDate(DateTime date) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(date);
}

getDatewithTime(DateTime date, TimeOfDay time) {
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

getDateWith12HrsFormat(DateTime date) {
  return DateFormat("h:mm a").format(date);
}

getBookingRegistrationNumberUsingTime() {
  return DateTime.now().millisecondsSinceEpoch;
}
