import 'dart:convert';
// todo active user must be known to do anywork in globals
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/HomeScreen/home_screen.dart';
import 'package:kkconferences/Screens/SignUp/admin/signup_admin.dart';
import 'package:kkconferences/api/firebase_clerk_api.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:kkconferences/model/staff_model.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:kkconferences/utils/validation.dart';
import 'package:kkconferences/widgets/sign_up_employee_radio_set.dart';
import 'package:uuid/uuid.dart';

class SignUpAdminProvider extends ChangeNotifier {
  var firestoreInstance = FirebaseFirestore.instance;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  String defautUser=SignUpRadioButtonAdmin.CLERK; // its shows default value onadmin sign up
  GlobalKey<ScaffoldState> skey;
  BuildContext context;

  reset(){

     firstnamecontroller = new TextEditingController();
     lastnamecontroller = new TextEditingController();
     emailcontroller = new TextEditingController();
     phonecontroller = new TextEditingController();
     passwordcontroller = new TextEditingController();
  }



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
    StaffModel staffModel= StaffModel(
        staffid: getUuid(),
        authority: defautUser,
        name: firstnamecontroller.text + lastnamecontroller.text,
        email: emailcontroller.text,
        phoneNumber: phonecontroller.text,
        password: passwordcontroller.text);
    StaffResult res = await FirebaseMemberApi().createStaffModel(staffModel) as StaffResult;
    showMessage(this.skey, res.msg);

    if (res.status == 1) {
   /*   Global.activeStaff=staffModel;
      Preference.setString(staff_credentials, jsonEncode(staffModel));*/
      // THERE IS NO NEED TO DO BECAUSE ADMIN SHIP NO BE DENIED
     // Navigator.pushNamedAndRemoveUntil(context, HomePage.classname, (route) => false);
    }
  }
}
