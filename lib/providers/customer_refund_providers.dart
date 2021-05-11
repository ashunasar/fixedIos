
import 'package:flutter/material.dart';

class CustomerRefundProvider extends ChangeNotifier{

 static CustomerRefundProvider _instance;

   CustomerRefundProvider ._private();

  factory CustomerRefundProvider.instance(){
     _instance??=CustomerRefundProvider._private();
     return _instance;
   }


}