import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';

class ActiveBookingItem extends StatelessWidget {
  String title;
  String amount;
  String start_duration;
  String end_duration;
  String date_of_booking;
  Function oncancel;
  bool disablecancel;

  ActiveBookingItem(
      {this.title = "Room name",
      this.amount = "0",
      this.start_duration,
      this.end_duration,
      this.oncancel,
      this.disablecancel = false,
      this.date_of_booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 450,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.black38,
          elevation: 9,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 225,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: new AssetImage('assets/rooma1.jpeg'),
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  height: 150,
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.green,
                              ),
                              Text(
                                " Start Time: ${start_duration}",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.red,
                              ),
                              Text(
                                " End Time: ${end_duration}",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_sharp,
                                color: Colors.black54,
                              ),
                              Text(
                                " Date of Booking: ${date_of_booking}",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.money_outlined,
                                color: Colors.black54,
                              ),
                              Text(
                                " Amount Paid: ${amount}",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
               if(disablecancel==false)
                InkWell(
                  onTap: () {
                    oncancel();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[800],
                    ),
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, color: Colors.white),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                      ],
                    ),
                  ),
                )
             else if(disablecancel==true)
                  InkWell(
                    onTap: () {
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[500],
                      ),
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )),
    );
  }
}

/*
 QuerySnapshot shot=await  FireBaseApi().   getMyBookings(Global.activeCustomer);

       print("size of data is ${shot.docs.length}");
           for(QueryDocumentSnapshot item in shot.docs){
             print(item.data());
           }



*/
