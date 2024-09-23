// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class CheckOutButton extends StatefulWidget {
//   final String checkDate;
//   final bool isCheckedIn;
//   final int employeeId; 

//   const CheckOutButton({
//     Key? key,
//     required this.checkDate,
//     required this.isCheckedIn,
//     required this.employeeId
//   }) : super(key: key);

//   @override
//   _CheckOutButtonState createState() => _CheckOutButtonState();
// }

// class _CheckOutButtonState extends State<CheckOutButton> {
//   String checkOutTime = 'Not yet checked out';
//   late DateTime selectedDate;
//   bool isCheckedOut = false; // Flag to track if check-out has been performed
//   bool readOnlyMode = false; // Flag to track if the button should be read-only
//   String sessionId = ''; // Session ID variable

//   @override
//   void initState() {
//     super.initState();
//     selectedDate = DateTime.parse(widget.checkDate);
//     // Fetch session ID when the widget initializes
//     fetchSessionId();
//   }



//   // Function to fetch session ID
//   Future<void> fetchSessionId() async {
//     // Fetch session ID from wherever it's stored
//     String? session = await getSessionIdFromWherever();
//     if (session != null) {
//       setState(() {
//         sessionId = session;
//       });
//     }
//   }

//   // Function to get session ID from wherever it's stored (e.g., shared preferences)
//   Future<String?> getSessionIdFromWherever() async {
//     // Implement your logic to fetch session ID here (e.g., from shared preferences)
//     return '7b111f1dba603cb9b9343918d81942386495fdd6'; // Dummy session ID for demonstration
//   }

//   Future<void> _checkOut() async {
//     final url = Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/attendance/check_out');
//     final headers = {
//       'Content-Type': 'application/json',
//       'Cookie': 'frontend_lang=en_US; session_id=$sessionId' // Use dynamic session ID
//     };
//     final body = json.encode({
//       "jsonrpc": "2.0",
//       "params": {
//         "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
//         "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
//         "api_key": "1394ae6755d2862731871b489fa9444c",
//         "employee_id": widget.employeeId,
//         "check_out": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
//         "out_latitude": "23.7529855",
//         "out_longitude": "90.4378656",
//         "out_country_name": "Bangladesh",
//         "out_city": "Dhaka",
//         "out_ip_address": "",
//         "out_browser": "Android"
//       }
//     });

//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print('Check-out successful${response.body}');
//       setState(() {
//         checkOutTime = DateFormat.jm().format(DateTime.now()); // Format time to AM/PM
//         isCheckedOut = true; // Update the flag to indicate check-out has been performed
//         readOnlyMode = true; // Enable read-only mode after check-out
//       });
//     } else {
//       print('Check-out failed: ${response.reasonPhrase}');
//       Fluttertoast.showToast(
//         msg: "Check-out failed. Please try again.",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   void _setCheckOutTime() {
//     if (widget.isCheckedIn && !isCheckedOut) {
//       _checkOut();
//     } else if (!widget.isCheckedIn) {
//       // Show toast message indicating that check-out cannot be performed until check-in is done
//       Fluttertoast.showToast(
//         msg: "You must check in before checking out.",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } else {
//       // Show toast message indicating that user has already checked out
//       Fluttertoast.showToast(
//         msg: "You have already checked out.",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     if (!isCheckedOut) {
//       final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101),
//       );
//       if (pickedDate != null && pickedDate != selectedDate) {
//         setState(() {
//           selectedDate = pickedDate;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: readOnlyMode ? null : _setCheckOutTime,
//             child: Row(
//               children: [
//                 const Text(
//                   'Check Out',
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: readOnlyMode ? null : _setCheckOutTime,
//                   child: Icon(
//                     Icons.exit_to_app,
//                     color: readOnlyMode
//                         ? Colors.grey
//                         : const Color.fromARGB(197, 241, 45, 45),
//                     size: 25,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (!readOnlyMode) const SizedBox(height: 10),
//           Row(
//             children: [
//               Text(
//                 'Date',
//                 style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
//               ),
//               const SizedBox(width: 10),
//               const Icon(Icons.calendar_today),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
//             style: TextStyle(
//                 fontSize: 18,
//                 color: isCheckedOut ? Colors.grey : Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Roboto'),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Check-Out',
//             style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
//           ),
//           const SizedBox(width: 10),
//           Text(
//             checkOutTime,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
//           ),
//           if (isCheckedOut) ...[
//             const SizedBox(height: 10),
//             Text(
//               'Status',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
//             ),
//             const Text(
//               "Overtime",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepOrangeAccent,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrms/Login/login_service.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CheckOutButton extends StatefulWidget {
  final String checkDate;
  final bool isCheckedIn;
  final int employeeId;

  const CheckOutButton({
    Key? key,
    required this.checkDate,
    required this.isCheckedIn,
    required this.employeeId,
  }) : super(key: key);

  @override
  _CheckOutButtonState createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  String checkOutTime = 'Not yet checked out';
  late DateTime selectedDate;
  bool isCheckedOut = false; // Flag to track if check-out has been performed
  bool readOnlyMode = false; // Flag to track if the button should be read-only
  String sessionId = ''; // Session ID variable

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.checkDate);
  }
  Future<void> _checkOut() async {
    final url = Uri.parse('https://vxservice17.xsellencebdltd.com/api/attendance/check_out');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=25d17c4a30984924d5862853b1b6a5aa663afe37'
    };
    
    final body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "638a849b-8fdd-4148-a9a0-eb28772c15e6",
        "secret_key": "956c9db53a453a15effd2497d775f733",
        "api_key": "8632a5478fe3aaa5d4d25616576b9174",
        "employee_id": "1453",
        "check_out": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        "in_latitude": auth.latitude,
        "in_longitude": auth.longitude,
        "out_country_name": "Bangladesh",
        "out_city": "Dhaka",
        "out_ip_address": "",
        "out_browser": "Android"
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Check-out successful');
      setState(() {
        checkOutTime = DateFormat.jm().format(DateTime.now()); // Format time to AM/PM
        isCheckedOut = true; // Update the flag to indicate check-out has been performed
        readOnlyMode = true; // Enable read-only mode after check-out
      });
    } else {
      print('Check-out failed: ${response.reasonPhrase}');
      Fluttertoast.showToast(
        msg: "Check-out failed. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _setCheckOutTime() {
    if (widget.isCheckedIn && !isCheckedOut) {
      _checkOut();
    } else if (!widget.isCheckedIn) {
      Fluttertoast.showToast(
        msg: "You must check in before checking out.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "You have already checked out.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    if (!isCheckedOut) {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: readOnlyMode ? null : _setCheckOutTime,
            child: Row(
              children: [
                const Text(
                  'Check Out',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: readOnlyMode ? null : _setCheckOutTime,
                  child: Icon(
                    Icons.exit_to_app,
                    color: readOnlyMode ? Colors.grey : const Color.fromARGB(197, 241, 45, 45),
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          if (!readOnlyMode) const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Date',
                style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.calendar_today),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
            style: TextStyle(
              fontSize: 18,
              color: isCheckedOut ? Colors.grey : Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Check-Out',
            style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
          ),
          const SizedBox(width: 10),
          Text(
            checkOutTime,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
          if (isCheckedOut) ...[
            const SizedBox(height: 10),
            Text(
              'Status',
              style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
            ),
            const Text(
              "Overtime",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
