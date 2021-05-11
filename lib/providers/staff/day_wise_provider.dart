import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/firebase_clerk_api.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/utils/dialog.dart';
import 'package:kkconferences/utils/m_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class DayWiseProvider extends ChangeNotifier {
  BuildContext context;
  List<BookingModel> list_of_bookings = [];

  TextEditingController dateController = new TextEditingController();

  loodBookings(DateTime date) async {
    list_of_bookings = [];
    MProgressIndicator.show(context);
    dateController.text = getFirebaseFormatDate(date);
    QuerySnapshot snapshot = await FirebaseMemberApi().getSelectedDateBookings(
        model: BookingModel(bookingDate: getFirebaseFormatDate(date)));
    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());
      list_of_bookings.add(model);
    }
    MProgressIndicator.hide();
    notifyListeners();
  }

  void performCall(BookingModel e) async {
    Customer model;
    QuerySnapshot snapshot = await FirebaseMemberApi().getCustomerDetails(e);
    for (QueryDocumentSnapshot item in snapshot.docs) {
      model = Customer.fromJson(item.data());
    }
    launch("tel://${model.phno}");
  }

   approveBookings(BookingModel bookingitem) async {
   QuerySnapshot snapshot=await FirebaseMemberApi().approveBooking(bookingitem);
   if(snapshot.size>=1) {
    bookingitem.bookingStatus=true;
     bookingitem.approvePerson=Global.activeStaff.staffid;

     await snapshot.docs[0].reference.update(bookingitem.toJson());


   }
   notifyListeners();
  }
}
