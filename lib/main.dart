import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/Screens/AdminBookingScreen/day_wise_booking.dart';
import 'package:kkconferences/Screens/SignInScreen/signin.dart';
import 'package:kkconferences/Screens/SignUp/admin/signup_admin.dart';
import 'package:kkconferences/Screens/my_bookings/my_bookings.dart';
import 'package:kkconferences/providers/booking_screen_provider.dart';
import 'package:kkconferences/providers/home_screen_provider.dart';
import 'package:kkconferences/providers/my_booking_provider.dart';
import 'package:kkconferences/providers/sign_in_provider.dart';
import 'package:kkconferences/providers/staff/day_wise_provider.dart';
import 'package:kkconferences/providers/staff/sign_up_admin_provider.dart';
import 'package:kkconferences/utils/preference.dart';
import 'package:kkconferences/widgets/active_booking_items.dart';
import 'package:provider/provider.dart';

import 'Screens/BookingScreen/booking_screen.dart';
import 'Screens/HomeDetail/hotel_detail_page.dart';
import 'Screens/SignUp/signup_user.dart';

import 'Screens/HomeScreen/home_screen.dart';

import 'Screens/splash/splash_screen.dart';
import 'global/constants.dart';
import 'model/customer.dart';
import 'providers/sign_up_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preference.load();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => SignUpProvider()),
      ChangeNotifierProvider(create: (ctx) => SignUpAdminProvider()),
      ChangeNotifierProvider(create: (ctx) => SignInProvider()),
      ChangeNotifierProvider(create: (ctx) => HomeScreenProvider()),
      ChangeNotifierProvider(create: (ctx) => BookingScreenProvider()),
      ChangeNotifierProvider(create: (ctx) => MyBookingProvider()),
      ChangeNotifierProvider(create: (ctx) => DayWiseProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: main_color,
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(title: 'Flutter Demo Home Page'),
      initialRoute: SplashScreen.classname,
      routes: {
        SplashScreen.classname: (context) => SplashScreen(),
        HomePage.classname: (context) => HomePage(),
        MyBookings.classname: (context) => MyBookings(),
        SignUpScreen.classname: (context) => SignUpScreen(),
        SignUpAdminScreen.classname: (context) => SignUpAdminScreen(),
        SignInPage.classname: (context) => SignInPage(),
        HotelDetailPage.classname: (context) => HotelDetailPage(),
        BookingScreen.classname: (context) => BookingScreen(),
        MyBookings.classname: (context) => MyBookings(),
        DayWiseBookings.classname: (context) => DayWiseBookings()
      },
    );
  }
}
