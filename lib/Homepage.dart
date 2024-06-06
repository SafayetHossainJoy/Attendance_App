// import 'dart:convert';
// import 'dart:async'; // Import Timer
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hrms/BreakTimePerDayCard/break_time.dart';
// import 'package:hrms/CheckInCard/checkIn.dart';
// import 'package:hrms/CheckOutCard/checkOut.dart';
// import 'package:hrms/CurrentLocationCard/location.dart';
// import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
// import 'package:hrms/UserProfileCard/userProfile_model.dart';

// import 'package:hrms/UserProfileCard/userprofile.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isCheckedIn = false;
//   bool isLoading = true;
//   late DateTime lastUpdatedDate;
//   UserProfile? userProfile;
//   WorkingDays? totalDays;

//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfile();
//     getToken();
//     fetchTotalDays();
//     // Initialize lastUpdatedDate with the current date
//     lastUpdatedDate = DateTime.now();
//     // Set up a Timer to check for updates every minute
//     Timer.periodic(Duration(minutes: 1), (Timer timer) {
//       if (DateTime.now().difference(lastUpdatedDate).inDays >= 1) {
//         // Auto update the homepage if a day has passed
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
//         print(
//             'Response body: $responseString'); // Debug: Print the response body

//         Map<String, dynamic> responseData = json.decode(responseString);
//         print(
//             'Response data: $responseData'); // Debug: Print the parsed response data

//         // Parse the response data to extract user details
//         List<dynamic> result = json.decode(responseData['result']);
//         var userDetails = result[0];

//         setState(() {
//           userProfile = UserProfile.fromJson(userDetails);
//           isLoading = false;
//         });
//       } catch (e) {
//         print('Error parsing response: $e');
//         Fluttertoast.showToast(
//           msg: "Failed to load user profile. Please try again.",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//         );
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } else {
//       print('Request failed: ${response.reasonPhrase}');
//       Fluttertoast.showToast(
//         msg: "Failed to load user profile. Please try again.",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
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

// Future<void> fetchTotalDays() async {
//   var headers = {
//     'Content-Type': 'application/json',
//     'Cookie':
//         'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
//   };
//   var request = http.Request(
//       'GET',
//       Uri.parse(
//           'https://odoo17e.xsellencebdltd.com/api/access_token/employee/working_days/employee'));
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
//       print('Response body: $responseString');

//       // Decode the string response into a JSON object
//       Map<String, dynamic> responseData = json.decode(responseString);
//       print('Response data: $responseData');

//       // Check if the 'result' field exists and is not null
//       if (responseData.containsKey('result') && responseData['result'] != null) {
//         // Extract the result field and parse it as a JSON object
//         Map<String, dynamic> resultData = json.decode(responseData['result']);
//         print('Result data: $resultData');

//         // Now you can parse the resultData into your WorkingDays object
//         setState(() {
//           totalDays = WorkingDays.fromJson(resultData);
//         });
//       } else {
//         // Handle case where 'result' field is missing or null
//         print('Error: Missing or null "result" field in response');
//       }
//     } catch (e) {
//       print('Error parsing response: $e');
//       // Handle error
//     }
//   } else {
//     print('Request failed: ${response.reasonPhrase}');
//     // Handle error
//   }
// }

//   void updateHomePage() {
//     setState(() {
//       // Update the lastUpdatedDate to the current date
//       lastUpdatedDate = DateTime.now();
//       // Trigger any other necessary updates here
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 2,
//           centerTitle: true,
//           title: const Text(
//             'Attendance Details',
//             style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Roboto'),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//             key: PageStorageKey<String>('homePageKey'),
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // if (userProfile == null)
//                               //   Center(child: CircularProgressIndicator())
//                               // else
//                               UserProfileCard(userProfile: userProfile),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       'Today Attendance',
//                       style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Roboto'),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       width: double.infinity,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Card(
//                               color: Colors.white,
//                               elevation: 3,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CheckInButton(
//                                       checkDate: DateTime.now().toString(),
//                                       onCheckIn: () {
//                                         setState(() {
//                                           isCheckedIn = true;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Expanded(
//                             child: Card(
//                               color: Colors.white,
//                               elevation: 3,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CheckOutButton(
//                                       checkDate: DateTime.now().toString(),
//                                       isCheckedIn: isCheckedIn,
//                                       employeeId: 1,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Flexible(
//                           flex: 1,
//                           child: AspectRatio(
//                             aspectRatio: 1,
//                             child: Card(
//                               color: Colors.white,
//                               elevation: 3,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     BreakTimePerDayCard(
//                                       breakTime: '30 minutes',
//                                       avgTime: 'Average Time 30',
//                                       employeeId: 1,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         Flexible(
//                           flex: 1,
//                           child: AspectRatio(
//                             aspectRatio: 1,
//                             child: Card(
//                               color: Colors.white,
//                               elevation: 3,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (totalDays != null)
//                                       TotalDaysPerMonthCard(
//                                         workingDays: totalDays,
//                                       ),
//                                     // You can add a loading indicator or error message here if needed
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           child: Card(
//                             color: Colors.white,
//                             elevation: 3,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.all(20.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CurrentLocationCard(
//                                     location: 'Banasree, Dhaka',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ]),
//             )));
//   }
// }
import 'dart:convert';
import 'dart:async'; // Import Timer
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/UserProfileCard/userProfile_model.dart';
import 'package:hrms/UserProfileCard/userprofile.dart';
import 'package:hrms/BreakTimePerDayCard/break_time.dart';
import 'package:hrms/CheckInCard/checkIn.dart';
import 'package:hrms/CheckOutCard/checkOut.dart';
import 'package:hrms/CurrentLocationCard/location.dart';
import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheckedIn = false;
  bool isLoading = true;
  late DateTime lastUpdatedDate;
  UserProfile? userProfile;
  WorkingDays? totalDays;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
    getToken();
    fetchTotalDays();
    // Initialize lastUpdatedDate with the current date
    lastUpdatedDate = DateTime.now();
    // Set up a Timer to check for updates every minute
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      if (DateTime.now().difference(lastUpdatedDate).inDays >= 1) {
        // Auto update the homepage if a day has passed
        updateHomePage();
      }
    });
  }

  Future<void> fetchUserProfile() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://odoo17e.xsellencebdltd.com/api/access_token/employee/user'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "user_id": 2 // Ensure this is an integer if expected by the API
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      try {
        String responseString = await response.stream.bytesToString();
        print('Response body: $responseString');

        Map<String, dynamic> responseData = json.decode(responseString);
        print('Response data: $responseData');

        List<dynamic> result = json.decode(responseData['result']);
        var userDetails = result[0];

        setState(() {
          userProfile = UserProfile.fromJson(userDetails);
          isLoading = false;
        });
      } catch (e) {
        print('Error parsing response: $e');
        Fluttertoast.showToast(
          msg: "Failed to load user profile. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('Request failed: ${response.reasonPhrase}');
      Fluttertoast.showToast(
        msg: "Failed to load user profile. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getToken() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'frontend_lang=en_US; session_id=2f90ad326125df42536e36a411bebfda66868f21'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://odoo17e.xsellencebdltd.com/api/retrive-access-token/'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {"db": "odoo17e", "username": "admin", "password": "1234"}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      var accessToken = jsonResponse['access_token'];
      var secretKey = jsonResponse['secret_key'];
      var apiKey = jsonResponse['api_key'];

      final storage = const FlutterSecureStorage();
      await storage.write(key: 'access_token', value: accessToken);
      await storage.write(key: 'secret_key', value: secretKey);
      await storage.write(key: 'api_key', value: apiKey);

      print("Tokens stored successfully: ${responseBody}");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> fetchTotalDays() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://odoo17e.xsellencebdltd.com/api/access_token/employee/working_days/employee'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "employee_id": "1"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      try {
        String responseString = await response.stream.bytesToString();
        print('Response body: $responseString');

        Map<String, dynamic> responseData = json.decode(responseString);
        print('Response data: $responseData');

        Map<String, dynamic> resultData = json.decode(responseData['result']);
        print('Result data: $resultData');

        setState(() {
          totalDays = WorkingDays.fromJson(resultData);
        });
      } catch (e) {
        print('Error parsing response: $e');
        // Handle error
      }
    } else {
      print('Request failed: ${response.reasonPhrase}');
      // Handle error
    }
  }

  void updateHomePage() {
    setState(() {
      lastUpdatedDate = DateTime.now();
    });
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
      body: SingleChildScrollView(
        key: PageStorageKey<String>('homePageKey'),
        child: Padding(
          padding: EdgeInsets.all(20.0),
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
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserProfileCard(userProfile: userProfile),
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
                                    isCheckedIn = true;
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
                                isCheckedIn: isCheckedIn,
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
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                              if (totalDays != null)
                                TotalDaysPerMonthCard(
                                  workingDays: totalDays,
                                ),
                              // You can add a loading indicator or error message here if needed
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
  }
}
