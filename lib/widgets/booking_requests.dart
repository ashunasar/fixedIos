import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';

class BookingRequest extends StatelessWidget {
  String title;
  String amount;
  String start_duration;
  String end_duration;
  String date_of_booking;
  Function onapprove;
  Function oncall;
  bool disableapprove;

  BookingRequest(
      {this.title = "Room name",
      this.amount = "0",
      this.start_duration,
      this.end_duration,
      this.onapprove,
        this.oncall,
      this.disableapprove = false, // true mean button grey and not active
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
               if(disableapprove==false)
                Row(
                  children: [
                  SizedBox(width: 20,),  InkWell(
                      onTap: () {
                        onapprove();
                      },
                      child: Container                (
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green[400],
                        ),
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Approve",
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                          ],
                        ),
                      ),
                    ), SizedBox(width: 10,), InkWell(
                      onTap: () {
                        oncall();
                      },
                      child: Container                (
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green[400],
                        ),
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Call User",
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                          ],
                        ),
                      ),
                    ),SizedBox(width: 20,),
                  ],
                )

             else if(disableapprove==true)
                 Row(
                   children: [
                     SizedBox(width: 20,),  InkWell(
                       onTap: () {
                         onapprove();
                       },
                       child: Container                (
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.grey[400],
                         ),
                         width: MediaQuery.of(context).size.width * .4,
                         height: MediaQuery.of(context).size.height * 0.05,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.check, color: Colors.white),
                             SizedBox(
                               width: 5,
                             ),
                             Text(
                               "Approve",
                               style: TextStyle(color: Colors.white, fontSize: 17),
                             ),
                             SizedBox(
                               width: 14,
                             ),
                           ],
                         ),
                       ),
                     ), SizedBox(width: 10,), InkWell(
                       onTap: () {
                     oncall();
                       },
                       child: Container                (
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.green[400],
                         ),
                         width: MediaQuery.of(context).size.width * .4,
                         height: MediaQuery.of(context).size.height * 0.05,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.phone, color: Colors.white),
                             SizedBox(
                               width: 5,
                             ),
                             Text(
                               "Call User",
                               style: TextStyle(color: Colors.white, fontSize: 17),
                             ),
                             SizedBox(
                               width: 14,
                             ),
                           ],
                         ),
                       ),
                     ),SizedBox(width: 20,),
                   ],
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
