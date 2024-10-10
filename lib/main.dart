// import 'package:flutter/material.dart';
// // import 'package:hrms/Homepage.dart';
// import 'package:hrms/splash.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//        home: SplashScreen(),
//       // home: ExpensePage(),
//       // home: AccessTokenPage(),
//          // home: TotalDaysPerMonthCard(),
//        //home: HomePage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hrms/Admin/Time-off_Approver/list_leave.dart';
import 'package:hrms/Leaves/leave_details.dart';
// import 'package:hrms/Holidays/allholidays.dart';
// import 'package:hrms/Holidays/allholidays.dart';
// import 'package:hrms/Homepage.dart';
import 'package:hrms/Login/login_service.dart';
import 'package:hrms/UserDataProvider.dart';
// import 'package:hrms/checkInOut.dart';
import 'package:hrms/splash.dart';
import 'package:provider/provider.dart';

import 'Attendance Request/attendance_request.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  LoginService.instance.initPrefs();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
       //home: DashboardScreen (),
       //home: EmployeeHistoryScreen(),
       //home:CheckInOutListPage() ,
      // home: HomePage(),
      // home: HolidaysListPage(),
      // home: LeaveDetailsPage(),
      // home: LeaveApprovalPage(),
      home: CheckInOutScreen()
    );
  }
}
