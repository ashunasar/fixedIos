


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/SignInScreen/signin.dart';
import 'package:kkconferences/Screens/my_bookings/my_bookings.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:kkconferences/widgets/active_booking_items.dart';

class CommonDrawer extends StatefulWidget {
  String username;
  String email;


  CommonDrawer({this.username="?", this.email=""});

  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return    ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(widget.username),
          accountEmail: Text(widget.email),
          currentAccountPicture: CircleAvatar(
            backgroundColor:
            Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.blue
                : Colors.white,
            child: Text(
              widget.username.characters.first,
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          onTap: () async{
      Navigator.pushNamed(context, MyBookings.classname);
       },
          title: Text("All Bookings"),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text("Cancel Bookings"),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile( onTap: () async{
          Global.activeCustomer=null;
          Preference.setString(login_credentials,null);
          Preference.setString(activeUser_pref,null);
          Navigator.pushNamed(context,SignInPage.classname);

        },
          title: Text("LogOut"),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
