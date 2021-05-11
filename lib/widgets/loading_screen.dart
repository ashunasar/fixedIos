import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkconferences/global/constants.dart';

class StateScreen  extends StatelessWidget {

  dynamic state;


  StateScreen({this.state=appstate.loading});

  @override
  Widget build(BuildContext context) {

    if(state==appstate.crash){
      return Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.width*0.3,
            child: SvgPicture.asset(
            "assets/server.svg",
      ),
          ),
          SizedBox(height: 20,),
          Center(child: Text("Internal Error ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))

      ],),);

    } else{
      return Container(
          child: Center(child: CircularProgressIndicator(),
          ));
    }

  }
}
