import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:uuid/uuid.dart';

class FireBaseApi {
  getSampleCustomer() {
    var uuid = Uuid();
    return Customer(
        customerId: uuid.v4(),
        customerName: "data",
        email: "abc@gmail.com",
        password: "1236547899",
        phno: "98191855655",
        created_at: DateTime.now());
  }

  createCustomer(Customer customer) async {
    bool user_flag = await checkUserExist(customer);
    if (user_flag == true) {
      return CustomerResult(status: 0, msg: "User Already Exist");
    }

    var uuid = Uuid();
    customer.customerId = uuid.v4();
    FirebaseFirestore.instance
        .collection("Customers")
        .add(customer.toJson())
        .then((value) {});
    return CustomerResult(status: 1, msg: "User Created successfully");
  }

  Future<QuerySnapshot> getCustomer(Customer customer) async {
    return await FirebaseFirestore.instance
        .collection("Customers")
        .where("email", isEqualTo: customer.email)
        .get()
        .then((value) {
      return value;
    });
  }

  Future<bool> checkUserExist(Customer customer) async {
    var snapshot = await getCustomer(customer);
    print("size of data is : ${snapshot.size}");

    if (snapshot != null) {
      if (snapshot.size > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  signIn(Customer customer) async {
    QuerySnapshot snapshot = await getCustomer(customer);
    try {
      QueryDocumentSnapshot result = snapshot.docs.first;
      if (result.exists) {
        if (customer.password == result.get("password") &&
            customer.email == result.get("email")) {
          return CustomerResult(
              status: 1,
              msg: "Login Successfull",
              customer: Customer.fromJson(result.data()));
        } else {
          return CustomerResult(status: 0, msg: "User not found");
        }
      }
    } catch (e) {
      return CustomerResult(status: 0, msg: "User not found");
    }
  }

  /*----------------------------------booking Time Slot Enteries----------------------------------------------------*/
  addBookingEntery({BookingModel model}) async {
    /*   var uuid = Uuid();
    model.bookingId= uuid.v4();*/
    model.createdon=getBookingRegistrationNumberUsingTime();
    FirebaseFirestore.instance
        .collection("Bookings")
        .add(model.toJson())
        .then((value) {});
  }

  Future<QuerySnapshot> getSelectedDateBookings({BookingModel model}) async {
    return await FirebaseFirestore.instance
        .collection("Bookings")
        .where("bookingDate", isEqualTo: model.bookingDate) .where("roomno", isEqualTo: model.roomno).orderBy("bookingStartduration",descending: false)
        .get()
        .then((value) {
      return value;
    });
  }

  Future<QuerySnapshot> getMyBookings(Customer customer) async {
    return await FirebaseFirestore.instance
        .collection("Bookings")
        .where("bookingUserId", isEqualTo: customer.customerId)
        .orderBy("createdon",descending: true)
        .get()
        .then((value) {
      return value;
    });
  }

}
