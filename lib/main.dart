import 'package:hrms/Expense/all_expense.dart';
// import 'package:hrms/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      home: ExpensePage(),
    );
  }
}

