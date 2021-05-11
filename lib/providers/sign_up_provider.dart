import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/HomeScreen/home_screen.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:kkconferences/utils/validation.dart';
import 'package:uuid/uuid.dart';

class SignUpProvider extends ChangeNotifier {
  var firestoreInstance = FirebaseFirestore.instance;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  GlobalKey<ScaffoldState> skey;
  BuildContext context;

  bool performBasicValidation() {
    bool iserror = false;
    if (firstnamecontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("FirstName is Undefined")));
      iserror = true;
    }

    if (emailcontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      iserror = true;
    }
    if (phonecontroller.text.isEmpty) {
      skey.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number is Undefined")));
      iserror = true;
    }
    if (passwordcontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      iserror = true;
    }

    if (Validation().isEmailValid(emailcontroller.text) == false) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Email Format Incorrect")));
    }
    if (Validation().isPhoneNumberValid(phonecontroller.text) == false) {
      skey.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number must be 10 digits")));
    }

    return iserror;
  }

  createUser() async {
    if (checkButtonEnable() == true) {
      disableButton();
      print("action started");
    }else{
      return;
    }
    bool iserror = performBasicValidation();
    if (iserror == true) return;
    Customer customer= Customer(
        customerId: getUuid(),
        customerName: firstnamecontroller.text + lastnamecontroller.text,
        created_at: DateTime.now(),
        email: emailcontroller.text,
        phno: phonecontroller.text,
        password: passwordcontroller.text);
        CustomerResult res = await FireBaseApi().createCustomer(customer) as CustomerResult;
        showMessage(this.skey, res.msg);

    if (res.status == 1) {
      Global.activeCustomer=customer;
      Preference.setString(login_credentials, jsonEncode(customer));
      Global.activeUser=CUSTOMER;
      Navigator.pushNamedAndRemoveUntil(context, HomePage.classname, (route) => false);
    }
  }
}
