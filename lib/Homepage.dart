// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:hrms/UserProfileCard/userProfile_model.dart';
// import 'package:hrms/UserProfileCard/userprofile.dart';
// import 'package:hrms/BreakTimePerDayCard/break_time.dart';
// import 'package:hrms/CheckInCard/checkIn.dart';
// import 'package:hrms/CheckOutCard/checkOut.dart';
// import 'package:hrms/CurrentLocationCard/location.dart';


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isCheckedIn = false;
//   bool isLoading = true;
//   late DateTime lastUpdatedDate;
//   UserProfile? userProfile;
//   WorkingDays? workingDays; // Add this line

//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfile();
//     getToken();
//     fetchWorkingDays(); // Fetch working days
//     lastUpdatedDate = DateTime.now();
//     Timer.periodic(const Duration(minutes: 1), (Timer timer) {
//       if (DateTime.now().difference(lastUpdatedDate).inDays >= 1) {
//         updateHomePage();
//       }
//     });
//   }

//   Future<void> fetchUserProfile() async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie':
//           'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
//     };
//     var request = http.Request(
//         'GET',
//         Uri.parse(
//             'https://odoo17e.xsellencebdltd.com/api/access_token/employee/user'));
//     request.body = json.encode({
//       "jsonrpc": "2.0",
//       "params": {
//         "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
//         "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
//         "api_key": "1394ae6755d2862731871b489fa9444c",
//         "user_id": 2 // Ensure this is an integer if expected by the API
//       }
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       try {
//         String responseString = await response.stream.bytesToString();
//         print('Response body: $responseString');

//         Map<String, dynamic> responseData = json.decode(responseString);
//         print('Response data: $responseData');

//         if (responseData['result'] != null) {
//           var result = json.decode(responseData['result']);
//           var userDetails = result[0];

//           setState(() {
//             userProfile = UserProfile.fromJson(userDetails);
//             isLoading = false;
//           });
//         } else {
//           throw Exception("Result is null");
//         }
//       } catch (e) {
//         print('Error parsing response: $e');
//         showErrorToast("Failed to load user profile. Please try again.");
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } else {
//       print('Request failed: ${response.reasonPhrase}');
//       showErrorToast("Failed to load user profile. Please try again.");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<void> getToken() async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie':
//           'frontend_lang=en_US; session_id=2f90ad326125df42536e36a411bebfda66868f21'
//     };
//     var request = http.Request(
//         'GET',
//         Uri.parse(
//             'https://odoo17e.xsellencebdltd.com/api/retrive-access-token/'));
//     request.body = json.encode({
//       "jsonrpc": "2.0",
//       "params": {"db": "odoo17e", "username": "admin", "password": "1234"}
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       var responseBody = await response.stream.bytesToString();
//       var jsonResponse = json.decode(responseBody);

//       var accessToken = jsonResponse['access_token'];
//       var secretKey = jsonResponse['secret_key'];
//       var apiKey = jsonResponse['api_key'];

//       final storage = const FlutterSecureStorage();
//       await storage.write(key: 'access_token', value: accessToken);
//       await storage.write(key: 'secret_key', value: secretKey);
//       await storage.write(key: 'api_key', value: apiKey);

//       print("Tokens stored successfully: ${responseBody}");
//     } else {
//       print(response.reasonPhrase);
//     }
//   }


//   // Fetch working days as defined previously
//   Future<void> fetchWorkingDays() async {
//   var headers = {
//     'Content-Type': 'application/json',
//     'Cookie': 'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
//   };
//   var request = http.Request(
//       'GET',
//       Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/employee/working_days/employee'));
//   request.body = json.encode({
//     "jsonrpc": "2.0",
//     "params": {
//       "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
//       "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
//       "api_key": "1394ae6755d2862731871b489fa9444c",
//       "employee_id": "1"
//     }
//   });
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     try {
//       String responseString = await response.stream.bytesToString();
//       print('Working Days Response body: $responseString');

//       Map<String, dynamic> responseData = json.decode(responseString);
//       print('Parsed response data: $responseData');

//       if (responseData['result'] != null) {
//         // Decode the nested JSON string
//         String nestedResultString = responseData['result'];
//         print('Result string: $nestedResultString');
        
//         Map<String, dynamic> nestedResult = json.decode(nestedResultString);
//         print('Nested result: $nestedResult');

//         // Access the working days data using the employee ID key
//         Map<String, dynamic> workingDaysData = nestedResult["1"];
//         WorkingDays workingDays = WorkingDays.fromJson(workingDaysData);

//         setState(() {
//           this.workingDays = workingDays;
//         });
//       } else {
//         throw Exception("Result is null");
//       }
//     } catch (e) {
//       print('Error parsing working days response: $e');
//       showErrorToast("Failed to load working days. Please try again.");
//     }
//   } else {
//     print('Working Days Request failed: ${response.reasonPhrase}');
//     showErrorToast("Failed to load working days. Please try again.");
//   }
// }


//   void showErrorToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//     );
//   }

//   void updateHomePage() {
//     setState(() {
//       lastUpdatedDate = DateTime.now();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 2,
//         centerTitle: true,
//         title: const Text(
//           'Attendance Details',
//           style: TextStyle(
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Roboto'),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         key: const PageStorageKey<String>('homePageKey'),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         UserProfileCard(userProfile: userProfile),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Today Attendance',
//                 style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Roboto'),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CheckInButton(
//                                 checkDate: DateTime.now().toString(),
//                                 onCheckIn: () {
//                                   setState(() {
//                                     isCheckedIn = true;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     Expanded(
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CheckOutButton(
//                                 checkDate: DateTime.now().toString(),
//                                 isCheckedIn: isCheckedIn,
//                                 employeeId: 1,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: AspectRatio(
//                       aspectRatio: 1,
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               BreakTimePerDayCard(
//                                 breakTime: '30 minutes',
//                                 avgTime: 'Average Time 30',
//                                 employeeId: 1,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Flexible(
//                     flex: 1,
//                     child: AspectRatio(
//                       aspectRatio: 1,
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//                               MonthCardPerTotalWDays(
//                                 workingDays: workingDays, // Pass workingDays object here
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CurrentLocationCard(
//                           location: 'Banasree, Dhaka',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hrms/BreakTimePerDayCard/break_time.dart';
import 'package:hrms/CheckInCard/checkIn.dart';
import 'package:hrms/CheckOutCard/checkOut.dart';
import 'package:hrms/CurrentLocationCard/location.dart';
import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
import 'package:hrms/UserDataProvider.dart';
import 'package:hrms/UserProfileCard/userprofile.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    userDataProvider.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Attendance Details',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<UserDataProvider>(
        builder: (context, userDataProvider, child) {
          if (userDataProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: userDataProvider.refreshData,
            child: SingleChildScrollView(
              key: const PageStorageKey<String>('homePageKey'),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserProfileCard(userProfile: userDataProvider.userProfile),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Today Attendance',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CheckInButton(
                                      checkDate: DateTime.now().toString(),
                                      onCheckIn: () {
                                        setState(() {
                                          // Do check-in logic here
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CheckOutButton(
                                      checkDate: DateTime.now().toString(),
                                      isCheckedIn: true, // Replace with actual check-in state
                                      employeeId: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BreakTimePerDayCard(
                                      breakTime: '30 minutes',
                                      avgTime: 'Average Time 30',
                                      employeeId: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MonthCardPerTotalWDays(
                                      workingDays: userDataProvider.workingDays,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CurrentLocationCard(
                                location: 'Banasree, Dhaka',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
