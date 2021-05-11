
import 'package:flutter/material.dart';
import 'package:kkconferences/global/Global.dart';

import 'package:kkconferences/providers/home_screen_provider.dart';
import 'package:kkconferences/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'hotel_item.dart';

class HomePage extends StatelessWidget {
  static const classname="/HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  CommonDrawer(username: Global.activeCustomer.customerName,
      email:  Global.activeCustomer.email,),
      ),
      appBar: AppBar(),
      body: HomeListBody(),
    );
  }
}

class HomeListBody extends StatefulWidget {
  const HomeListBody({
    Key key,
  }) : super(key: key);

  @override
  _HomeListBodyState createState() => _HomeListBodyState();
}

class _HomeListBodyState extends State<HomeListBody> {


  @override
  Widget build(BuildContext context) {

    return Consumer<HomeScreenProvider>(
      builder: (context, value,child) {
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: value.rooms.length,
                itemBuilder: (_, index) => BookingRoomItem(
                  room: value.rooms[index],
                  key: UniqueKey(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider=Provider.of<HomeScreenProvider>(context,listen: false);
    //provider.init();
  }

  @override
  void initState() {
    super.initState();


  }
}
