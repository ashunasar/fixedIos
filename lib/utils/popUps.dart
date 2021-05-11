

import 'package:flutter/material.dart';

toast(GlobalKey<ScaffoldState> key,msg){
  key.currentState.showSnackBar(SnackBar(content: Text(msg)));

}

