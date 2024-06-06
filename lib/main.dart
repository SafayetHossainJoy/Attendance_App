import 'package:flutter/material.dart';
import 'package:hrms/Homepage.dart';
import 'package:hrms/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       //home: SplashScreen(),
      // home: ExpensePage(),
      // home: AccessTokenPage(),
         // home: TotalDaysPerMonthCard(),
home: HomePage(),
    );
  }
}
