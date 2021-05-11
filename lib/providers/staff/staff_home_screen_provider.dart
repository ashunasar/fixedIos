

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StaffHomeScreenProvider extends ChangeNotifier{

  static StaffHomeScreenProvider _instance;
   StaffHomeScreenProvider._private();

  factory StaffHomeScreenProvider.instance(){
    _instance ??= StaffHomeScreenProvider._private();
    return _instance;
  }


}