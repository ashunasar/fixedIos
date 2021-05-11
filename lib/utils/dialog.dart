

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DialogUtil {
  BuildContext context;
  String message;
  String title;
  String buttontext;
  Function btnOkOnPress;
  Function btnCancelOnPress;

  DialogUtil({this.context, this.message, this.title, this.buttontext,this.btnCancelOnPress,this.btnOkOnPress});

  showErrorDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  showWarningDialog(){

    AwesomeDialog dialog=   AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: title,
        btnOkText: buttontext,
        desc: message,
        btnCancelOnPress:btnCancelOnPress,
        btnOkOnPress:btnOkOnPress,
      )..show();
   return dialog;

  }


}
