import 'package:flutter/material.dart';


class SignInAllUserRadioButton extends StatefulWidget {
  static const  String CUSTOMER="Customer";
  static const  String CLERK="Clerk";
  static const  String ADMIN="Admin";
  Function(String) onChange;

  SignInAllUserRadioButton({this.onChange, Key key}) : super(key: key);

  @override
  _SignInAllUserRadioButtonState createState() => _SignInAllUserRadioButtonState();
}

enum UserType { ADMIN, CLERK, CUSTOMER }

class _SignInAllUserRadioButtonState extends State<SignInAllUserRadioButton> {
  UserType SELECTED = UserType.CUSTOMER;

  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getRadioButton(UserType.CUSTOMER,SignInAllUserRadioButton.CUSTOMER),
          getRadioButton(UserType.CLERK,SignInAllUserRadioButton.CLERK),
          getRadioButton(UserType.ADMIN,SignInAllUserRadioButton.ADMIN),
        ],
      ),
    );
  }

  Widget getRadioButton(dynamic value,String title){
    TextStyle style=TextStyle(fontSize: 14,fontWeight: FontWeight.bold);
    return   GestureDetector(
      onTap: (){
        setState(() {
          SELECTED = value;
          widget.onChange(title);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AbsorbPointer(
              child: Radio(
                value: value,
                groupValue: SELECTED,
                onChanged: (vale){},
              ),
            ),
            Text(title,style: style,),
          ],
        ),
      ),
    );
  }



}
