// import 'package:hrms/Expense/all_expense.dart';
// import 'package:hrms/acessToken.dart';
// import 'package:hrms/Expense/DashBoard/expense_dashboard.dart';
// import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
// import 'package:hrms/splash.dart';
import 'package:flutter/material.dart';
import 'package:hrms/test.dart';

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
         home: UserProfileScreen(),
    );
  }
}
