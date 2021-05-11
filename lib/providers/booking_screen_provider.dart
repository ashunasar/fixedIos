import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kkconferences/Screens/BookingScreen/booking_helper.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:kkconferences/model/carrage_model.dart';
import 'package:kkconferences/utils/popUps.dart';
import 'package:kkconferences/widgets/chip.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

enum bookstatus { startdate, enddate }

// todo add which room task
class BookingScreenProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> key;
  dynamic activeStatus;
  Razorpay razorpay;
  TextEditingController curruntDateController = new TextEditingController();
  static const platform = const MethodChannel("razorpay_flutter");
  DateTime meeting_date;
  TextEditingController startTimeController = new TextEditingController();

  TextEditingController endTimeController = new TextEditingController();
  TimeOfDay startTime;
  TimeOfDay endTime;
  BuildContext context;
  List<BookingModel> todayMeetings = [];

  Carrage carrage;

  setDate(DateTime date) async {
    this.meeting_date = date;

    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    curruntDateController.text = formatter.format(date);

    showTodayMettings(date, carrage);
    //  QuerySnapshot snapshot = await BookingHelper(context).getBookings(date);
  }

  void setStartTime(TimeOfDay picked) {
    startTime = picked;
    startTimeController.text = getFormattedTime(picked);

    // start date
    Duration(hours: picked.hour, minutes: picked.minute).inSeconds;
  }

  void setEndTime(TimeOfDay picked) {
    endTime = picked;
    endTimeController.text = getFormattedTime(picked);
  }

  void calculateBookingAmount() async {
    if (meeting_date == null) {
      toast(key, "Date not Selected");
      return;
    }

    if (endTime == null || startTime == null) {
      toast(key, "Start and endtime both required");
      return;
    }

    if (endTime.hour >= 23 || startTime.hour < 7) {
      toast(key, "Night Meeting are not supported");
      return;
    }

    if (startTime.hour > endTime.hour) {
      toast(key, "Please correct endtime");
      return;
    }
    int hourDifference = endTime.hour - startTime.hour;
    int minutesDifference = endTime.minute - startTime.minute;

    int cuuruntMeetingStartDuration =
        Duration(hours: startTime.hour, minutes: startTime.minute).inSeconds;
    int cuuruntMeetingEndDuration =
        Duration(hours: endTime.hour, minutes: endTime.minute).inSeconds;
    int meetingDuration =
        cuuruntMeetingEndDuration - cuuruntMeetingStartDuration;

    if (meetingDuration < 3500) {
      toast(key, "Meeting should be greater than 1 hour");
      return;
    }

    if (minutesDifference > 10) {
      hourDifference += 1;
    }

 //   double totalAmount = hourDifference * 100.toDouble();
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        headerAnimationLoop: false,
        animType: AnimType.TOPSLIDE,
        showCloseIcon: true,
        closeIcon: Icon(Icons.close_fullscreen_outlined),
        title: 'Confirm Booking',
        desc: 'Do you Agreed to Confirm Booking for $hourDifference hour',
        btnOkText: "Confirm",
        btnCancelText: "Cancel",
        btnCancelOnPress: () async {
          await BookingHelper().convertSecondsToTime(75600);
        },
        btnOkOnPress: () async {
          await BookingHelper().performBooking(context,
              endTime: endTime,
              startTime: startTime,
              date: meeting_date,
              hourdifference: hourDifference,
              carrage: carrage);

          //  await BookingHelper().checkIsBookingExist(endTime: endTime,startTime: startTime,date: meeting_date);

          /*      openCheckout(
              totalAmount * 100, "Amount paid for $hourDifference hrs meeting");*/
        })
      ..show();
   // print("amount paid is ${totalAmount}");
  }

  void showTodayMettings(DateTime date, Carrage carrage) async {
    todayMeetings = [];
    QuerySnapshot snapshot = await BookingHelper().getBookings(date, carrage);
    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());
      todayMeetings.add(model);
      print(model.toJson());
    }
    notifyListeners();
  }



/* end There is payment gateway code */

}
