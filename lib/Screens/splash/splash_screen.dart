import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/SignInScreen/signin.dart';
import 'package:kkconferences/Screens/splash/splash_helper.dart';
import 'package:kkconferences/api/firebase_clerk_api.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/model/staff_model.dart';
import 'package:kkconferences/utils/preference.dart';

import '../AdminBookingScreen/day_wise_booking.dart';
import '../SignUp/signup_user.dart';
import '../HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const classname = "/SplashScreen";
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _message = '';

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();

    super.initState();
    Timer(Duration(seconds: 3), () {
      performNavigate();
    });
  }

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => log(token));
  }

  void getMessage() {
    // _firebaseMessaging.configure(
    //     onMessage: (Map<String, dynamic> message) async {
    //   print('received message');
    //   setState(() => _message = message["notification"]["body"]);
    // }, onResume: (Map<String, dynamic> message) async {
    //   print('on resume $message');
    //   setState(() => _message = message["notification"]["body"]);
    // }, onLaunch: (Map<String, dynamic> message) async {
    //   print('on launch $message');
    //   setState(() => _message = message["notification"]["body"]);
    // });
  }

  performNavigate() async {
    await SplashHelper().initRoomInfo(context);

    String active_user_type = await Preference.getString(activeUser_pref);

    if (active_user_type == null) {
      print("user not logged in yet");
      Navigator.pushReplacementNamed(context, SignInPage.classname);
    } else {
      if (active_user_type == CUSTOMER) {
        performCustomerNavigate();
      } else if (active_user_type == CLERK) {
        performStaffNavigate();
      }
    }

    //FireBaseApi().checkUserExist(Customer(email: "abc@gmail.com"));
  }

  performCustomerNavigate() {
    if (Preference.getString(login_credentials) == null) {
      print("user not logged in yet");
      Navigator.pushReplacementNamed(context, SignInPage.classname);
    } else {
      Global.activeCustomer = Customer.fromJson(
          jsonDecode(Preference.getString(login_credentials)));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomePage.classname, (route) => false);
      print("name of active customer is ${Global.activeCustomer.email}");
    }
  }

  performStaffNavigate() async {
    String staff_data = await Preference.getString(staff_credentials);
    if (staff_data == null) {
      print("user not logged in yet");
      Navigator.pushReplacementNamed(context, SignInPage.classname);
    } else {
      Global.activeStaff = StaffModel.fromJson(
          jsonDecode(Preference.getString(staff_credentials)));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(DayWiseBookings.classname, (route) => false);
      print("name of active staff is ${Global.activeStaff.email}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //    color: main_color,
        color: Colors.white,
        child: Image.asset('assets/logo.png'));
  }
}
