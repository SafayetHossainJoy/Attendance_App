// // // // core part
// // // // import 'dart:async';
// // // // import 'dart:convert';
// // // // import 'package:hrms/Login/login_service.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:flutter/material.dart';
// // // // import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // import 'My Profile/employee_model.dart';

// // // // class UserDataProvider with ChangeNotifier {
// // // //   Employee? employee;
// // // //   WorkingDays? _workingDays;
// // // //   bool _isLoading = true;
// // // //   Timer? _updateTimer;

// // // //   Employee? get userProfile => employee;
// // // //   WorkingDays? get workingDays => _workingDays;
// // // //   bool get isLoading => _isLoading;

// // // //   UserDataProvider() {
// // // //     _init();
// // // //   }

// // // //   Future<void> _init() async {
// // // //     await fetchUserData();
// // // //     _setupAutoUpdate();
// // // //   }

// // // //   Future<void> fetchUserData() async {
// // // //     final prefs = await SharedPreferences.getInstance();

// // // //     if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
// // // //       final userProfileData = prefs.getString('userProfile');
// // // //       final workingDaysData = prefs.getString('workingDays');

// // // //       employee = Employee.fromJson(json.decode(userProfileData!));
// // // //       _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     } else {
// // // //       await fetchUserProfile();
// // // //       await fetchWorkingDays();
// // // //     }
// // // //   }

// // // // Future<void> fetchUserProfile() async {
// // // //   _isLoading = true;
// // // //   notifyListeners();

// // // //     var headers = {
// // // //       'Content-Type': 'application/json',
// // // //       'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // // //     };

// // // //   var request = http.Request(
// // // //     'GET',
// // // //     Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
// // // //   );
// // // //   request.body = json.encode({
// // // //     "jsonrpc": "2.0",
// // // //     "params": {
// // // //         "access_token": auth.currentAccessToken,
// // // //         "secret_key": auth.currentSecretKey,
// // // //         "api_key": auth.currentApiKey,
// // // //         "user_id": auth.currentUserId
// // // //     }
// // // //   });
// // // //   request.headers.addAll(headers);

// // // //   try {
// // // //     http.StreamedResponse response = await request.send();

// // // //     if (response.statusCode == 200) {
// // // //       String responseString = await response.stream.bytesToString();
// // // //       Map<String, dynamic> responseData = json.decode(responseString);

// // // //       if (responseData['result'] != null) {
// // // //         var result = json.decode(responseData['result']);

// // // //         // Check if result is a non-empty list
// // // //         if (result is List && result.isNotEmpty) {
// // // //           var userDetails = result[0];

// // // //           // Use the fromJson method to handle user profile data
// // // //           employee = Employee.fromJson(userDetails);

// // // //           // Store the user profile in SharedPreferences
// // // //           final prefs = await SharedPreferences.getInstance();
// // // //           prefs.setString('userProfile', json.encode(userDetails));
// // // //         } else {
// // // //           throw Exception("User profile list is empty");
// // // //         }

// // // //         _isLoading = false;
// // // //         notifyListeners();
// // // //       } else {
// // // //         throw Exception("Result is null");
// // // //       }
// // // //     } else {
// // // //       throw Exception("Failed to load user profile");
// // // //     }
// // // //   } catch (e) {
// // // //     print("Error fetching user profile: $e");
// // // //     _isLoading = false;
// // // //     notifyListeners();
// // // //   }
// // // // }

// // // // Future<void> fetchWorkingDays() async {
// // // //   _isLoading = true;
// // // //   notifyListeners();

// // // //     var headers = {
// // // //       'Content-Type': 'application/json',
// // // //       'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // // //     };

// // // //   var request = http.Request(
// // // //     'GET',
// // // //     Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/working_days/employee'),
// // // //   );
// // // //   request.body = json.encode({
// // // //     "jsonrpc": "2.0",
// // // //     "params": {
// // // //         "access_token": auth.currentAccessToken,
// // // //         "secret_key": auth.currentSecretKey,
// // // //         "api_key": auth.currentApiKey,
// // // //         "employee_id": auth.currentEmployeeId
// // // //     }
// // // //   });
// // // //   request.headers.addAll(headers);

// // // //   try {
// // // //     http.StreamedResponse response = await request.send();

// // // //     if (response.statusCode == 200) {
// // // //       String responseString = await response.stream.bytesToString();
// // // //       Map<String, dynamic> responseData = json.decode(responseString);

// // // //       if (responseData['result'] != null) {
// // // //         // The result is a JSON string, so we decode it first
// // // //         String nestedResultString = responseData['result'];
// // // //         Map<String, dynamic> nestedResult = json.decode(nestedResultString);

// // // //         // Extract the first entry in the map (e.g., "1325")
// // // //         if (nestedResult.isNotEmpty) {
// // // //           Map<String, dynamic> workingDaysData = nestedResult.values.first;

// // // //           // Parse the working days data
// // // //           _workingDays = WorkingDays.fromJson(workingDaysData);

// // // //           // Save to SharedPreferences
// // // //           final prefs = await SharedPreferences.getInstance();
// // // //           prefs.setString('workingDays', json.encode(workingDaysData));

// // // //           _isLoading = false;
// // // //           notifyListeners();
// // // //         } else {
// // // //           throw Exception("Nested result is empty");
// // // //         }
// // // //       } else {
// // // //         throw Exception("Result is null");
// // // //       }
// // // //     } else {
// // // //       throw Exception("Failed to load working days");
// // // //     }
// // // //   } catch (e) {
// // // //     print("Error fetching working days: $e");
// // // //     _isLoading = false;
// // // //     notifyListeners();
// // // //   }
// // // // }

// // // //   Future<void> refreshData() async {
// // // //     await fetchUserProfile();
// // // //     await fetchWorkingDays();
// // // //   }

// // // //   void _setupAutoUpdate() {
// // // //     _updateTimer?.cancel();
// // // //     _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
// // // //       await refreshData();
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _updateTimer?.cancel();
// // // //     super.dispose();
// // // //   }
// // // // }
// // // import 'dart:async';
// // // import 'dart:convert';
// // // import 'package:hrms/Login/login_service.dart';
// // // import 'package:hrms/UserProfileCard/userProfile_model.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:flutter/material.dart';
// // // import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // class UserDataProvider with ChangeNotifier {
// // //   UserProfile? userProfile;
// // //   WorkingDays? _workingDays;
// // //   bool _isLoading = true;
// // //   Timer? _updateTimer;

// // //   UserProfile? get profile => userProfile; // Updated getter to reflect new naming
// // //   WorkingDays? get workingDays => _workingDays;
// // //   bool get isLoading => _isLoading;

// // //   UserDataProvider() {
// // //     _init();
// // //   }

// // //   Future<void> _init() async {
// // //     await fetchUserData();
// // //     _setupAutoUpdate();
// // //   }

// // //   Future<void> fetchUserData() async {
// // //     final prefs = await SharedPreferences.getInstance();

// // //     if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
// // //       final userProfileData = prefs.getString('userProfile');
// // //       final workingDaysData = prefs.getString('workingDays');

// // //       // Parse the cached user profile and working days
// // //       userProfile = UserProfile.fromJson(json.decode(userProfileData!)); // Updated class name
// // //       _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

// // //       _isLoading = false;
// // //       notifyListeners();
// // //     } else {
// // //       // If not found in cache, fetch from API
// // //       await fetchUserProfile();
// // //       //await fetchWorkingDays();
// // //     }
// // //   }

// // //   Future<void> fetchUserProfile() async {
// // //   _isLoading = true;
// // //   notifyListeners();

// // //   // var headers = {
// // //   //   'Content-Type': 'application/json',
// // //   //   'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // //   // };
// // //   var headers = {
// // //   'Content-Type': 'application/json',
// // //   'Cookie': 'session_id=b245fbb3f3a82ef7fd545908cfe4caf7ac354144'
// // // };

// // //   var request = http.Request(
// // //     'GET',
// // //     Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
// // //   );
// // //   request.body = json.encode({
// // //     "jsonrpc": "2.0",
// // //     "params": {
// // //       // "access_token": auth.currentAccessToken,
// // //       // "secret_key": auth.currentSecretKey,
// // //       // "api_key": auth.currentApiKey,
// // //       // "user_id": auth.currentUserId
// // //           "access_token": "d09569ed-73f6-42f9-94a6-40f3a3fcad6b",
// // //           "secret_key": "bf297d78e7d296e35cd4d5e6f0e96c59",
// // //           "api_key": "7bad8960b969a453c49bed293f0f3e9d",
// // //           "user_id": "26"
// // //     }
// // //   });
// // //   request.headers.addAll(headers);

// // //   try {
// // //     http.StreamedResponse response = await request.send();

// // //     if (response.statusCode == 200) {
// // //       String responseString = await response.stream.bytesToString();
// // //       Map<String, dynamic> responseData = json.decode(responseString);

// // //       // Print the responseData to check the structure
// // //       print('API Response001: $responseData');

// // //       if (responseData['result'] != null) {
// // //         var result = responseData['result'];

// // //         // Print the result to check its contents
// // //         print('Result: $result');

// // //         if (result is List && result.isNotEmpty) {
// // //           var userDetails = result[0];

// // //           // Parse user profile
// // //           userProfile = UserProfile.fromJson(userDetails);

// // //           // Store the user profile in SharedPreferences
// // //           final prefs = await SharedPreferences.getInstance();
// // //           prefs.setString('userProfile', json.encode(userDetails));

// // //           _isLoading = false;
// // //           notifyListeners();
// // //         } else {
// // //           throw Exception("User profile list is empty");
// // //         }
// // //       } else {
// // //         throw Exception("Result is null");
// // //       }
// // //     } else {
// // //       throw Exception("Failed to load user profile");
// // //     }
// // //   } catch (e) {
// // //     print("Error fetching user profile: $e");
// // //     _isLoading = false;
// // //     notifyListeners();
// // //   }
// // // }

// // //   // Future<void> fetchUserProfile() async {
// // //   //   _isLoading = true;
// // //   //   notifyListeners();

// // //   //   var headers = {
// // //   //     'Content-Type': 'application/json',
// // //   //     'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // //   //   };

// // //   //   var request = http.Request(
// // //   //     'GET',
// // //   //     Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
// // //   //   );
// // //   //   request.body = json.encode({
// // //   //     "jsonrpc": "2.0",
// // //   //     "params": {
// // //   //       "access_token": auth.currentAccessToken,
// // //   //       "secret_key": auth.currentSecretKey,
// // //   //       "api_key": auth.currentApiKey,
// // //   //       "user_id": auth.currentUserId
// // //   //     }
// // //   //   });
// // //   //   request.headers.addAll(headers);

// // //   //   try {
// // //   //     http.StreamedResponse response = await request.send();

// // //   //     if (response.statusCode == 200) {
// // //   //       String responseString = await response.stream.bytesToString();
// // //   //       Map<String, dynamic> responseData = json.decode(responseString);

// // //   //       if (responseData['result'] != null) {
// // //   //         var result = responseData['result']; // Directly use result without json.decode

// // //   //         // Check if result is a non-empty list
// // //   //         if (result is List && result.isNotEmpty) {
// // //   //           var userDetails = result[0];

// // //   //           // Use UserProfile class to handle user profile data
// // //   //           userProfile = UserProfile.fromJson(userDetails); // Updated to UserProfile

// // //   //           // Store the user profile in SharedPreferences
// // //   //           final prefs = await SharedPreferences.getInstance();
// // //   //           prefs.setString('userProfile', json.encode(userDetails));

// // //   //           _isLoading = false;
// // //   //           notifyListeners();
// // //   //         } else {
// // //   //           throw Exception("User profile list is empty");
// // //   //         }
// // //   //       } else {
// // //   //         throw Exception("Result is null");
// // //   //       }
// // //   //     } else {
// // //   //       throw Exception("Failed to load user profile");
// // //   //     }
// // //   //   } catch (e) {
// // //   //     print("Error fetching user profile: $e");
// // //   //     _isLoading = false;
// // //   //     notifyListeners();
// // //   //   }
// // //   // }

// // // //WorkingDays

// // //   // Future<void> fetchWorkingDays() async {
// // //   //   _isLoading = true;
// // //   //   notifyListeners();

// // //   //   var headers = {
// // //   //     'Content-Type': 'application/json',
// // //   //     'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // //   //   };

// // //   //   var request = http.Request(
// // //   //     'GET',
// // //   //     Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/working_days/employee'),
// // //   //   );
// // //   //   request.body = json.encode({
// // //   //     "jsonrpc": "2.0",
// // //   //     "params": {
// // //   //       "access_token": auth.currentAccessToken,
// // //   //       "secret_key": auth.currentSecretKey,
// // //   //       "api_key": auth.currentApiKey,
// // //   //       "employee_id": auth.currentEmployeeId
// // //   //     }
// // //   //   });
// // //   //   request.headers.addAll(headers);

// // //   //   try {
// // //   //     http.StreamedResponse response = await request.send();

// // //   //     if (response.statusCode == 200) {
// // //   //       String responseString = await response.stream.bytesToString();
// // //   //       Map<String, dynamic> responseData = json.decode(responseString);

// // //   //       if (responseData['result'] != null) {
// // //   //         // The result is a JSON string, so we decode it first
// // //   //         String nestedResultString = responseData['result'];
// // //   //         Map<String, dynamic> nestedResult = json.decode(nestedResultString);

// // //   //         // Extract the first entry in the map (e.g., "1325")
// // //   //         if (nestedResult.isNotEmpty) {
// // //   //           Map<String, dynamic> workingDaysData = nestedResult.values.first;

// // //   //           // Parse the working days data
// // //   //           _workingDays = WorkingDays.fromJson(workingDaysData);

// // //   //           // Save to SharedPreferences
// // //   //           final prefs = await SharedPreferences.getInstance();
// // //   //           prefs.setString('workingDays', json.encode(workingDaysData));

// // //   //           _isLoading = false;
// // //   //           notifyListeners();
// // //   //         } else {
// // //   //           throw Exception("Nested result is empty");
// // //   //         }
// // //   //       } else {
// // //   //         throw Exception("Result is null");
// // //   //       }
// // //   //     } else {
// // //   //       throw Exception("Failed to load working days");
// // //   //     }
// // //   //   } catch (e) {
// // //   //     print("Error fetching working days: $e");
// // //   //     _isLoading = false;
// // //   //     notifyListeners();
// // //   //   }
// // //   // }

// // //   Future<void> refreshData() async {
// // //     await fetchUserProfile();
// // //     //await fetchWorkingDays();
// // //   }

// // //   void _setupAutoUpdate() {
// // //     _updateTimer?.cancel();
// // //     _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
// // //       await refreshData();
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _updateTimer?.cancel();
// // //     super.dispose();
// // //   }
// // // }

// // // // import 'dart:async';
// // // // import 'dart:convert';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:flutter/material.dart';
// // // // import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// // // // import 'package:hrms/UserProfileCard/userProfile_model.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // class UserDataProvider with ChangeNotifier {
// // // //   UserProfile? _userProfile;
// // // //   WorkingDays? _workingDays;
// // // //   bool _isLoading = true;
// // // //   Timer? _updateTimer;

// // // //   UserProfile? get userProfile => _userProfile;
// // // //   WorkingDays? get workingDays => _workingDays;
// // // //   bool get isLoading => _isLoading;

// // // //   UserDataProvider() {
// // // //     _init();
// // // //   }

// // // //   Future<void> _init() async {
// // // //     await _initializePreferences();
// // // //     await fetchUserData();
// // // //     _setupAutoUpdate();
// // // //   }

// // // //   Future<void> _initializePreferences() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     if (!prefs.containsKey('access_token') ||
// // // //         !prefs.containsKey('secret_key') ||
// // // //         !prefs.containsKey('api_key') ||
// // // //         !prefs.containsKey('employee_id')) {
// // // //       throw Exception("Missing credentials in SharedPreferences");
// // // //     }
// // // //   }

// // // //   Future<Map<String, String>> _getHeaders() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     final sessionId = prefs.getString('sessionId') ?? '';
// // // //     return {
// // // //       'Content-Type': 'application/json',
// // // //       'Cookie': 'frontend_lang=en_US; session_id=$sessionId',
// // // //     };
// // // //   }

// // // //   Future<Map<String, dynamic>> _getCredentials() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     return {
// // // //       'access_token': prefs.getString('access_token') ?? '',
// // // //       'secret_key': prefs.getString('secret_key') ?? '',
// // // //       'api_key': prefs.getString('api_key') ?? '',
// // // //       'user_id': prefs.getString('user_id') ?? '',
// // // //       'employee_id': prefs.getString('employee_id') ?? ''
// // // //     };
// // // //   }

// // // //   Future<void> fetchUserData() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
// // // //       final userProfileData = prefs.getString('userProfile');
// // // //       final workingDaysData = prefs.getString('workingDays');

// // // //       _userProfile = UserProfile.fromJson(json.decode(userProfileData!));
// // // //       _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     } else {
// // // //       await fetchUserProfile();
// // // //       await fetchWorkingDays();
// // // //     }
// // // //   }

// // // //   Future<void> fetchUserProfile() async {
// // // //     _isLoading = true;
// // // //     notifyListeners();

// // // //     final headers = await _getHeaders();
// // // //     final credentials = await _getCredentials();

// // // //     var request = http.Request(
// // // //       'GET',
// // // //       Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
// // // //     );
// // // //     request.body = json.encode({
// // // //       "jsonrpc": "2.0",
// // // //       "params": {
// // // //         "access_token": credentials['access_token'],
// // // //         "secret_key": credentials['secret_key'],
// // // //         "api_key": credentials['api_key'],
// // // //         "user_id": credentials['user_id']
// // // //       }
// // // //     });
// // // //     request.headers.addAll(headers);

// // // //     try {
// // // //       http.StreamedResponse response = await request.send();

// // // //       if (response.statusCode == 200) {
// // // //         String responseString = await response.stream.bytesToString();
// // // //         Map<String, dynamic> responseData = json.decode(responseString);

// // // //         if (responseData['result'] != null) {
// // // //           var result = json.decode(responseData['result']);
// // // //           var userDetails = result[0];

// // // //           _userProfile = UserProfile.fromJson(userDetails);
// // // //           _isLoading = false;

// // // //           final prefs = await SharedPreferences.getInstance();
// // // //           prefs.setString('userProfile', json.encode(userDetails));

// // // //           notifyListeners();
// // // //         } else {
// // // //           throw Exception("Result is null");
// // // //         }
// // // //       } else {
// // // //         throw Exception("Failed to load user profile");
// // // //       }
// // // //     } catch (e) {
// // // //       print("Error fetching user profile: $e");
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   Future<void> fetchWorkingDays() async {
// // // //     _isLoading = true;
// // // //     notifyListeners();

// // // //     final headers = await _getHeaders();
// // // //     final credentials = await _getCredentials();

// // // //     var request = http.Request(
// // // //       'GET',
// // // //       Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/working_days/employee'),
// // // //     );
// // // //     request.body = json.encode({
// // // //       "jsonrpc": "2.0",
// // // //       "params": {
// // // //         "access_token": credentials['access_token'],
// // // //         "secret_key": credentials['secret_key'],
// // // //         "api_key": credentials['api_key'],
// // // //         "employee_id": credentials['employee_id']
// // // //       }
// // // //     });
// // // //     request.headers.addAll(headers);

// // // //     try {
// // // //       http.StreamedResponse response = await request.send();

// // // //       if (response.statusCode == 200) {
// // // //         String responseString = await response.stream.bytesToString();
// // // //         Map<String, dynamic> responseData = json.decode(responseString);

// // // //         if (responseData['result'] != null) {
// // // //           String nestedResultString = responseData['result'];
// // // //           Map<String, dynamic> nestedResult = json.decode(nestedResultString);
// // // //           Map<String, dynamic> workingDaysData = nestedResult["1"];

// // // //           _workingDays = WorkingDays.fromJson(workingDaysData);

// // // //           final prefs = await SharedPreferences.getInstance();
// // // //           prefs.setString('workingDays', json.encode(workingDaysData));

// // // //           _isLoading = false;
// // // //           notifyListeners();
// // // //         } else {
// // // //           throw Exception("Result is null");
// // // //         }
// // // //       } else {
// // // //         throw Exception("Failed to load working days");
// // // //       }
// // // //     } catch (e) {
// // // //       print("Error fetching working days: $e");
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   Future<void> refreshData() async {
// // // //     await fetchUserProfile();
// // // //     await fetchWorkingDays();
// // // //   }

// // // //   void _setupAutoUpdate() {
// // // //     _updateTimer?.cancel();
// // // //     _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
// // // //       await refreshData();
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _updateTimer?.cancel();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // // // import 'dart:async';
// // // // // import 'dart:convert';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:http/http.dart' as http;
// // // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // // import 'package:hrms/Login/login_service.dart';
// // // // // import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
// // // // // import 'package:hrms/UserProfileCard/userProfile_model.dart';

// // // // // class UserDataProvider with ChangeNotifier {
// // // // //   UserProfile? _userProfile;
// // // // //   WorkingDays? _workingDays;
// // // // //   bool _isLoading = true;
// // // // //   Timer? _updateTimer;

// // // // //   UserProfile? get userProfile => _userProfile;
// // // // //   WorkingDays? get workingDays => _workingDays;
// // // // //   bool get isLoading => _isLoading;

// // // // //   UserDataProvider() {
// // // // //     _init();
// // // // //   }

// // // // //   Future<void> _init() async {
// // // // //     await fetchUserData();
// // // // //     _setupAutoUpdate();
// // // // //   }

// // // // //   Future<void> fetchUserData() async {
// // // // //     final prefs = await SharedPreferences.getInstance();

// // // // //     if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
// // // // //       final userProfileData = prefs.getString('userProfile');
// // // // //       final workingDaysData = prefs.getString('workingDays');

// // // // //       _userProfile = UserProfile.fromJson(json.decode(userProfileData!));
// // // // //       _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     } else {
// // // // //       await fetchUserProfile();
// // // // //       await fetchWorkingDays();
// // // // //     }
// // // // //   }

// // // // //   Future<void> fetchUserProfile() async {
// // // // //     _isLoading = true;
// // // // //     notifyListeners();

// // // // //     var headers = {
// // // // //       'Content-Type': 'application/json',
// // // // //       'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // // // //     };
// // // // //     var request = http.Request(
// // // // //         'GET',
// // // // //         Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'));
// // // // //     request.body = json.encode({
// // // // //       "jsonrpc": "2.0",
// // // // //       "params": {
// // // // //         "access_token": auth.currentAccessToken,
// // // // //         "secret_key": auth.currentSecretKey,
// // // // //         "api_key": auth.currentApiKey,
// // // // //         "user_id": auth.currentUserId
// // // // //       }
// // // // //     });
// // // // //     request.headers.addAll(headers);

// // // // //     try {
// // // // //       http.StreamedResponse response = await request.send();

// // // // //       if (response.statusCode == 200) {
// // // // //         String responseString = await response.stream.bytesToString();
// // // // //         Map<String, dynamic> responseData = json.decode(responseString);

// // // // //         if (responseData['result'] != null) {
// // // // //           var result = json.decode(responseData['result']);
// // // // //           var userDetails = result[0];

// // // // //           _userProfile = UserProfile.fromJson(userDetails);
// // // // //           _isLoading = false;

// // // // //           final prefs = await SharedPreferences.getInstance();
// // // // //           prefs.setString('userProfile', json.encode(userDetails));

// // // // //           notifyListeners();
// // // // //         } else {
// // // // //           throw Exception("Result is null");
// // // // //         }
// // // // //       } else {
// // // // //         throw Exception("Failed to load user profile");
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print("Error fetching user profile: $e");
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   Future<void> fetchWorkingDays() async {
// // // // //     _isLoading = true;
// // // // //     notifyListeners();

// // // // //     var headers = {
// // // // //       'Content-Type': 'application/json',
// // // // //       'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
// // // // //     };
// // // // //     var request = http.Request(
// // // // //         'GET',
// // // // //         Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/working_days/employee'));
// // // // //     request.body = json.encode({
// // // // //       "jsonrpc": "2.0",
// // // // //       "params": {
// // // // //         "access_token": auth.currentAccessToken,
// // // // //         "secret_key": auth.currentSecretKey,
// // // // //         "api_key": auth.currentApiKey,
// // // // //         "employee_id": auth.currentEmployeeId
// // // // //       }
// // // // //     });
// // // // //     request.headers.addAll(headers);

// // // // //     try {
// // // // //       http.StreamedResponse response = await request.send();

// // // // //       if (response.statusCode == 200) {
// // // // //         String responseString = await response.stream.bytesToString();
// // // // //         Map<String, dynamic> responseData = json.decode(responseString);

// // // // //         if (responseData['result'] != null) {
// // // // //           String nestedResultString = responseData['result'];
// // // // //           Map<String, dynamic> nestedResult = json.decode(nestedResultString);
// // // // //           Map<String, dynamic> workingDaysData = nestedResult["1"];

// // // // //           _workingDays = WorkingDays.fromJson(workingDaysData);

// // // // //           final prefs = await SharedPreferences.getInstance();
// // // // //           prefs.setString('workingDays', json.encode(workingDaysData));

// // // // //           _isLoading = false;
// // // // //           notifyListeners();
// // // // //         } else {
// // // // //           throw Exception("Result is null");
// // // // //         }
// // // // //       } else {
// // // // //         throw Exception("Failed to load working days");
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print("Error fetching working days: $e");
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   Future<void> refreshData() async {
// // // // //     await fetchUserProfile();
// // // // //     await fetchWorkingDays();
// // // // //   }

// // // // //   void _setupAutoUpdate() {
// // // // //     _updateTimer?.cancel();
// // // // //     _scheduleNextUpdate();
// // // // //   }

// // // // //   void _scheduleNextUpdate() {
// // // // //     final now = DateTime.now();
// // // // //     final nextMonth = DateTime(now.year, now.month + 1, now.day, now.hour, now.minute);
// // // // //     final durationUntilNextMonth = nextMonth.difference(now);

// // // // //     _updateTimer = Timer(durationUntilNextMonth, () async {
// // // // //       await refreshData();
// // // // //       _scheduleNextUpdate();  // Schedule next update after current update
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _updateTimer?.cancel();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // import 'dart:async';
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:hrms/UserProfileCard/userProfile_model.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// // class UserDataProvider with ChangeNotifier {
// //   UserProfile? userProfile;
// //   bool _isLoading = true;
// //   Timer? _updateTimer;

// //   UserProfile? get profile => userProfile;
// //   bool get isLoading => _isLoading;

// //   UserDataProvider() {
// //     _init();
// //   }

// //   Future<void> _init() async {
// //     await fetchUserData();
// //     _setupAutoUpdate();
// //   }

// //   Future<void> fetchUserData() async {
// //     final prefs = await SharedPreferences.getInstance();

// //     if (prefs.containsKey('userProfile')) {
// //       final userProfileData = prefs.getString('userProfile');
// //       userProfile = UserProfile.fromJson(json.decode(userProfileData!));
// //       _isLoading = false;
// //       notifyListeners();
// //     } else {
// //       await fetchUserProfile();
// //     }
// //   }

// //   Future<void> fetchUserProfile() async {
// //     _isLoading = true;
// //     notifyListeners();

// //     var headers = {
// //       'Content-Type': 'application/json',
// //       'Cookie': 'session_id=b245fbb3f3a82ef7fd545908cfe4caf7ac354144',
// //     };

// //     var request = http.Request(
// //       'GET',
// //       Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
// //     );
// //     request.body = json.encode({
// //       "jsonrpc": "2.0",
// //       "params": {
// //         "access_token": "d09569ed-73f6-42f9-94a6-40f3a3fcad6b",
// //         "secret_key": "bf297d78e7d296e35cd4d5e6f0e96c59",
// //         "api_key": "7bad8960b969a453c49bed293f0f3e9d",
// //         "user_id": "26"
// //       }
// //     });
// //     request.headers.addAll(headers);

// //     try {
// //       http.StreamedResponse response = await request.send();

// //       if (response.statusCode == 200) {
// //         String responseString = await response.stream.bytesToString();
// //         Map<String, dynamic> responseData = json.decode(responseString);

// //         // Check if 'result' exists and handle it as a map
// //         if (responseData['result'] != null) {
// //           var result = responseData['result'];

// //           if (result is Map<String, dynamic>) {
// //             userProfile = UserProfile.fromJson(result);

// //             // Store the user profile in SharedPreferences
// //             final prefs = await SharedPreferences.getInstance();
// //             prefs.setString('userProfile', json.encode(result));

// //             _isLoading = false;
// //             notifyListeners();
// //           } else {
// //             throw Exception("Unexpected result format");
// //           }
// //         } else {
// //           throw Exception("Result is null");
// //         }
// //       } else {
// //         throw Exception("Failed to load user profile");
// //       }
// //     } catch (e) {
// //       print("Error fetching user profile: $e");
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> refreshData() async {
// //     await fetchUserProfile();
// //   }

// //   void _setupAutoUpdate() {
// //     _updateTimer?.cancel();
// //     _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
// //       await refreshData();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _updateTimer?.cancel();
// //     super.dispose();
// //   }
// // }

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:hrms/Login/login_service.dart';
// import 'package:hrms/UserProfileCard/userProfile_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class UserDataProvider with ChangeNotifier {
//   UserProfile? userProfile;
//   bool _isLoading = true;
//   Timer? _updateTimer;

//   UserProfile? get profile => userProfile;
//   bool get isLoading => _isLoading;

//   UserDataProvider() {
//     _init();
//   }

//   Future<void> _init() async {
//     await fetchUserData();
//     _setupAutoUpdate();
//   }

//   Future<void> fetchUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     print('Checking SharedPreferences for cached user profile...');

//     if (prefs.containsKey('userProfile')) {
//       final userProfileData = prefs.getString('userProfile');
//       userProfile = UserProfile.fromJson(json.decode(userProfileData!));
//       _isLoading = false;
//       notifyListeners();
//       print('Loaded user profile from SharedPreferences.');
//     } else {
//       print('No cached user profile found. Fetching from API...');
//       await fetchUserProfile();
//     }
//   }

//   Future<void> fetchUserProfile() async {
//     _isLoading = true;
//     notifyListeners();

//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
//     };

//     var request = http.Request(
//       'GET',
//       Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
//     );
//     request.body = json.encode({
//       "jsonrpc": "2.0",
//       "params": {
//         "access_token": auth.currentAccessToken,
//         "secret_key": auth.currentSecretKey,
//         "api_key": auth.currentApiKey,
//         "user_id": auth.currentUserId
//       }
//     });
//     request.headers.addAll(headers);

//     try {
//       print('Sending API request...');
//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         String responseString = await response.stream.bytesToString();
//         print('API response received 123: $responseString');

//         Map<String, dynamic> responseData = json.decode(responseString);

//         // Check if 'result' exists and handle it as a map or list
//         if (responseData['result'] != null) {
//           var result = responseData['result'];

//           // If result is a list, check for empty list or parse first entry
//           if (result is List && result.isNotEmpty) {
//             var userDetails = result[0];
//             userProfile = UserProfile.fromJson(userDetails);
//           }
//           // If result is a map, parse it directly
//           else if (result is Map<String, dynamic>) {
//             userProfile = UserProfile.fromJson(result);
//           } else {
//             throw Exception("Unexpected result format");
//           }

//           // Store the user profile in SharedPreferences
//           final prefs = await SharedPreferences.getInstance();
//           prefs.setString('userProfile', json.encode(result));

//           _isLoading = false;
//           notifyListeners();
//         } else {
//           throw Exception("Result is null");
//         }
//       } else {
//         print('API request failed with status: ${response.statusCode}');
//         print('Response body: ${await response.stream.bytesToString()}');
//         throw Exception("Failed to load user profile");
//       }
//     } catch (e) {
//       print("Error fetching user profile: $e");
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> refreshData() async {
//     await fetchUserProfile();
//   }

//   void _setupAutoUpdate() {
//     _updateTimer?.cancel();
//     _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
//       await refreshData();
//     });
//   }

//   @override
//   void dispose() {
//     _updateTimer?.cancel();
//     super.dispose();
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:hrms/Login/login_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
import 'package:hrms/UserProfileCard/userProfile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserProfile? _userProfile;
  WorkingDays? _workingDays;
  bool _isLoading = true;
  // Timer? _updateTimer;

  UserProfile? get userProfile => _userProfile;
  WorkingDays? get workingDays => _workingDays;
  bool get isLoading => _isLoading;

  UserDataProvider() {
    _init();
  }

  Future<void> _init() async {
    await fetchUserData();
    //_setupAutoUpdate();
  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
      final userProfileData = prefs.getString('userProfile');
      final workingDaysData = prefs.getString('workingDays');

      _userProfile = UserProfile.fromJson(json.decode(userProfileData!));
      _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

      _isLoading = false;
      notifyListeners();
    } else {
      await fetchUserProfile();
      await fetchWorkingDays();
    }
  }

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    notifyListeners();

    var headers = {
  'Content-Type': 'application/json',
  'Cookie': 'session_id=9c4c7ab1be2cd0f4f54c884bf5195d604d7a28f8'
};

    var request = http.Request(
      'GET',
      Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'),
    );

    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "a802a0d5-fecb-4328-ba0b-ffbaf3f44d76",
        "secret_key": "e2f0b36ac619a5d40fba357409bdd5e3",
        "api_key": "2bcbf9c7407900050bd870a925e97a47",
        "user_id": "26"
      }
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseString);

        // Log the full response for debugging
        print("Full API Response: $responseData");

        // Check if 'result' and 'employee' fields are present
        if (responseData['result'] != null &&
            responseData['result']['employee'] != null) {
          var employeeList = responseData['result']['employee'];

          if (employeeList.isNotEmpty) {
            // Access the first employee's details
            var userDetails = employeeList[0];

            // Parse and set the UserProfile data
            _userProfile = UserProfile.fromJson(userDetails);

            // Save to SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('userProfile', json.encode(userDetails));

            _isLoading = false;
            notifyListeners();
          } else {
            throw Exception("Employee list is empty");
          }
        } else {
          throw Exception("Invalid response: 'result' or 'employee' is null.");
        }
      } else {
        throw Exception(
            "Failed to load user profile. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    } finally {
      // Ensure the loading state is reset in case of success or error
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWorkingDays() async {
    _isLoading = true;
    notifyListeners();

    var headers = {
  'Content-Type': 'application/json',
  'Cookie': 'session_id=9c4c7ab1be2cd0f4f54c884bf5195d604d7a28f8'
};

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://vxservice17.xsellencebdltd.com/api/employee/working_days/employee'),
    );

    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "a802a0d5-fecb-4328-ba0b-ffbaf3f44d76",
        "secret_key": "e2f0b36ac619a5d40fba357409bdd5e3",
        "api_key": "2bcbf9c7407900050bd870a925e97a47",
        "employee_id": "1453"
      }
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseString);

        // Safely accessing nested JSON data
        if (responseData['result'] != null &&
            responseData['result']['working_days'] != null) {
          Map<String, dynamic> workingDaysData =
              responseData['result']['working_days']['1453'];

          // Parse and set the working days data using your model
          _workingDays = WorkingDays.fromJson(workingDaysData);

          // Save to SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('workingDays', json.encode(workingDaysData));

          _isLoading = false;
          notifyListeners();
        } else {
          throw Exception(
              "Invalid response: 'result' or 'working_days' is null.");
        }
      } else {
        throw Exception(
            "Failed to load working days. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching working days: $e");
      _isLoading = false;
      notifyListeners();
    } finally {
      // Ensure loading state is reset even if there's an error
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> refreshData() async {
  //   await fetchUserProfile();
  //   await fetchWorkingDays();
  // }

  // void _setupAutoUpdate() {
  //   _updateTimer?.cancel();
  //   _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
  //     await refreshData();
  //   });
  // }

  // @override
  // void dispose() {
  //   _updateTimer?.cancel();
  //   super.dispose();
  // }
}
