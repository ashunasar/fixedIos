import 'package:flutter/material.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/providers/staff/day_wise_provider.dart';
import 'package:kkconferences/utils/dialog.dart';
import 'package:kkconferences/widgets/booking_requests.dart';
import 'package:kkconferences/widgets/drawer.dart';
import 'package:provider/provider.dart';

class DayWiseBookings extends StatefulWidget {
  static const classname = "/DayWiseBookings";

  @override
  _DayWiseBookingsState createState() => _DayWiseBookingsState();
}

class _DayWiseBookingsState extends State<DayWiseBookings> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DayWiseProvider>(context);
    provider.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Today Bookings "),
      ),
      drawer: Drawer(
        child: CommonDrawer(
          username: Global.activeStaff.name,
          email: Global.activeStaff.email,
        ),
      ),
      body: Consumer<DayWiseProvider>(builder: (context, value, c) {
        return Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: InkWell(
                  onTap: () async {
                    DateTime date = DateTime.now();
                    FocusScope.of(context).requestFocus(new FocusNode());
                    DateTime picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(
                          DateTime.now().year - 1, DateTime.now().month - 1, 1),
                      initialDate: DateTime(
                          DateTime.now().year, DateTime.now().month, 1),
                      lastDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 31),
                    );
                    if (picked != null && picked != date) {
                      value.loodBookings(picked);
                    }
                  },
                  child: AbsorbPointer(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      child: TextFormField(
                        controller: value.dateController,
                        // controller: value.curruntDateController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          hintText: 'Select date to show bookings',
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
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              Expanded(
                child: ListView(
                  //shrinkWrap: true,
                  children: [
                 /*   ...value.list_of_bookings.map((e) => BookingRequest(
                          title: "Conference Room " + e.room ?? "",
                          amount: e.amount ?? "",
                          start_duration:
                              getDateWith12HrsFormat(e.bookingStartTime),
                          end_duration:
                              getDateWith12HrsFormat(e.bookingEndTime),
                          date_of_booking: e.bookingDate,
                          onapprove: () {
                            DialogUtil(
                              btnOkOnPress: () {
                                value.approveBookings(e);
                              },
                              context: context,
                              message:
                                  "Do you approve the same customer are reach at customer location. ",
                              title: "Did customer visit on site?",
                            ).showWarningDialog();
                          },
                          oncall: () {
                            value.performCall(e);
                          },
                          disableapprove: e.bookingStatus ?? false,
                        ))
                 */ ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<DayWiseProvider>(context, listen: false);
    Future.delayed(Duration(seconds: 1)).then((value) {
      provider.loodBookings(DateTime.now());
      provider.dateController.text = getFirebaseFormatDate(DateTime.now());
    });
  }
}
