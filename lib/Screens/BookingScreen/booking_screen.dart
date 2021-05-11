import 'package:flutter/material.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/providers/booking_screen_provider.dart';
import 'package:kkconferences/widgets/booking_items.dart';
import 'package:kkconferences/widgets/green_button.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  static const classname = "/BookingScreen";

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingScreenProvider>(context);
    provider.context = context;
    provider.carrage=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: provider.key,
      appBar: AppBar(
        title: Text("Book Conference Room Panel"),
        backgroundColor: main_color,
      ),
      body: Consumer<BookingScreenProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        DateTime date = DateTime.now();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        DateTime picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now().subtract(Duration(days: 0)),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year,
                              DateTime.now().month + 1, 31),
                        );
                        if (picked != null && picked != date) {
                          // add this line.
                          value.setDate(picked);
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          child: TextField(
                            controller: value.curruntDateController,
                            autocorrect: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Choose Meeting Date here...',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.black54,
                              ),
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.black38, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black54, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());

                        TimeOfDay picked = await showTimePicker(
                            initialEntryMode: TimePickerEntryMode.dial,
                            context: context,
                            initialTime: time,
                            builder: (BuildContext context, Widget child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child,
                              );
                            });
                        if (picked != null) {
                          value.setStartTime(picked);
                        }
                        ;
                      },
                      child: AbsorbPointer(
                        child: Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            controller: value.startTimeController,
                            autocorrect: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Start Time',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.black54,
                              ),
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.black38, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black54, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());

                        TimeOfDay picked = await showTimePicker(
                            context: context,
                            initialTime: time,
                            builder: (BuildContext context, Widget child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child,
                              );
                            });
                        if (picked != null) {
                          // add this line.
                          value.setEndTime(picked);
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            controller: value.endTimeController,
                            autocorrect: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'End Time',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.black54,
                              ),
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.black38, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black54, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // booking button
                InkWell(
                  onTap: () {
                    value.calculateBookingAmount();
                  },
                  child: GreenButton(
                    text: "Book Now",
                    fontsize: 17,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Booking on Same Day",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 250),
              child: Expanded(
                child: ListView.builder(
                  itemCount: value.todayMeetings.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: BookingItem(
                        endTime: getDateWith12HrsFormat(value.todayMeetings[index].bookingEndTime),
                        startTime:
                        getDateWith12HrsFormat(value.todayMeetings[index].bookingStartTime),
                        dateStr: value.todayMeetings[index].bookingDate,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  void initState() {
    final provider = Provider.of<BookingScreenProvider>(context, listen: false);
    provider.key = GlobalKey<ScaffoldState>();
  provider.todayMeetings=[];
  }

  void dispose() {
    super.dispose();
    final provider = Provider.of<BookingScreenProvider>(context, listen: false);
    provider.razorpay.clear();
  }
}
