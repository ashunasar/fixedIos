import 'package:flutter/material.dart';

class SignUpRadioButtonAdmin extends StatefulWidget {
  static const  String CLERK="Clerk";
  static const  String ADMIN="Admin";
  Function(String) onChange;

  SignUpRadioButtonAdmin({this.onChange, Key key}) : super(key: key);

  @override
  _SignUpRadioButtonAdminState createState() => _SignUpRadioButtonAdminState();
}

enum UserType { ADMIN, CLERK }

class _SignUpRadioButtonAdminState extends State<SignUpRadioButtonAdmin> {
  UserType SELECTED = UserType.CLERK;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getRadioButton(UserType.CLERK,SignUpRadioButtonAdmin.CLERK),
          getRadioButton(UserType.ADMIN,SignUpRadioButtonAdmin.ADMIN),
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
