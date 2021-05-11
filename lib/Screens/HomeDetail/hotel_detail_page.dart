
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/model/confress_model.dart';

import 'info/hotel_info_tab.dart';
import 'review/hotel_review_tab.dart';
import 'room/hotel_room_tab.dart';

class HotelDetailPage extends StatefulWidget {

static const classname="/HotelDetailPage";

  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  @override
  Widget build(BuildContext context) {

    RoomInfo room=ModalRoute.of(context).settings.arguments;

    return Container(
      color: Theme.of(context).canvasColor,
      child: Stack(
        children: <Widget>[
          HotelFeedBodyBackground(room: room),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 0,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 32,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              body: HotelFeedBody(room: room),
            ),
          ),
        ],
      ),
    );



  }
}

class HotelFeedBodyBackground extends StatelessWidget {
  const HotelFeedBodyBackground({
    Key key,
    @required this.room,
  }) : super(key: key);

  final   RoomInfo room;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * .60,
      child: Hero(
        tag: Key('key' + room.leadImage),
        child: Container(
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(room.leadImage), fit: BoxFit.cover),
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .25,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, .8),
                    end: Alignment(0, 0),
                    colors: [
                  Color(0xEE000000),
                  Color(0x33000000),
                ])),
          ),
        ),
      ),
    );
  }
}

class HotelFeedBody extends StatelessWidget {
  final   RoomInfo room;

  const HotelFeedBody({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 32, right: 32, bottom: 60, top: 144),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 8),
          Expanded(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              elevation: 8,
              child: Container(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: TabBarView(
                            children: [
                              HotelInformationTab(room: room),
                              HotelRoomTab(rooms: room.room_images),
                           /*   HotelReviewTab(reviews: hotel.reviews),*/
                            ],
                          ),
                        ),
                      ),
                      TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: Color(0xDD613896), width: 4.0),
                          insets: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'INFO',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'ROOMS',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
