import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:kkconferences/utils/dialog.dart';

class MyBookingProvider extends ChangeNotifier {
  List<BookingModel> mybookings;
  dynamic currunt_state = appstate.default_state;
  BuildContext context;

  loadMyBookings() async {
    currunt_state = appstate.loading;
    QuerySnapshot snapshot;
    notifyListeners();
    mybookings = [];

    try {
      snapshot = await FireBaseApi().getMyBookings(Global.activeCustomer);
    } catch (e) {
      appstate.crash;
    }

    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());
      mybookings.add(model);
      /*   item.data().forEach((key, value) {
        print(value);
      });*/
    }
    currunt_state = appstate.loading_complete;
    notifyListeners();
  }

  void performCancelBooking(int index) {
    DialogUtil(
            context: context,
            title: "Confirmation Cancel",
            message: "Do you really like to cancel it take 7 days to refund",
            buttontext: "Yes do it",
            btnOkOnPress: () {},btnCancelOnPress: (){})
        .showWarningDialog();
  }
}
