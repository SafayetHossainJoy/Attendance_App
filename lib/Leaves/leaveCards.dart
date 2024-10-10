// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'leave_summary_card.dart';

// class LeaveCards extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         LeavesummaryCard(
//           icon: FontAwesomeIcons.calendarAlt,
//           title: 'Annual Leave',
//           value: '10',
//           color: Colors.blue,
//         ),
//         LeavesummaryCard(
//           icon: FontAwesomeIcons.firstAid,
//           title: 'Sick Leave',
//           value: '14',
//           color: Colors.orange,
//         ),
//         LeavesummaryCard(
//           icon: FontAwesomeIcons.umbrellaBeach,
//           title: 'Casual Leave',
//           value: '10',
//           color: Colors.green,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrms/Leaves/leavedata_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'leave_summary_card.dart'; // This imports the LeavesummaryCard widget

class LeaveCards extends StatefulWidget {
  @override
  _LeaveCardsState createState() => _LeaveCardsState();
}

class _LeaveCardsState extends State<LeaveCards> {
  List<LeaveData> leaveData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLeaveData();
  }

  Future<void> fetchLeaveData() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=27ddad8d905fd778a19f97c94d8b58f46f20942f'
    };

    var request = http.Request('GET', Uri.parse('https://vxservice17.xsellencebdltd.com/api/leave/allocation_count'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "42d86d63-6e17-40d9-9720-44930b29a7b2",
        "secret_key": "bbdb4747d580353db87d1e578e518b15",
        "api_key": "39d14e1990c5b89a4e44ef677241b789",
        "employee_id": 1381
      }
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> result = jsonDecode(responseBody)['result'];
      
      // Parse the data
      List<LeaveData> tempData = result.entries.map((e) {
        return LeaveData.fromJson(e.key, e.value);
      }).toList();

      setState(() {
        leaveData = tempData;
        isLoading = false;
      });
    } else {
      print('Failed to fetch leave data: ${response.reasonPhrase}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  if (isLoading) {
    return Center(child: CircularProgressIndicator()); // Loading state
  }

  // Define icons and colors based on the leave type
  Map<String, IconData> leaveIcons = {
    "Earned Leave": FontAwesomeIcons.calendarAlt,
    "Sick Time Off": FontAwesomeIcons.firstAid,
    "Casual Leave": FontAwesomeIcons.umbrellaBeach,
    // Add more icons for other leave types if necessary
  };

  Map<String, Color> leaveColors = {
    "Earned Leave": Colors.blue,
    "Sick Time Off": Colors.orange,
    "Casual Leave": Colors.green,
    // Add more colors for other leave types if necessary
  };

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: leaveData
        .where((data) => leaveIcons.containsKey(data.leaveType)) // Only show supported leave types
        .map((data) {
      return Expanded(  // Ensure each LeaveCard takes up equal space
        child: LeavesummaryCard(
          icon: leaveIcons[data.leaveType] ?? FontAwesomeIcons.questionCircle,
          title: data.leaveType,
          value: data.leaveType == "Earned Leave" 
            ? data.leaveValue.toStringAsFixed(3)  // Format "Earned Leave" to 2 decimal places
            : data.leaveValue.toString(),
          color: leaveColors[data.leaveType] ?? Colors.grey,
        ),
      );
    }).toList(),
  );
  
}

  // @override
  // Widget build(BuildContext context) {
  //   if (isLoading) {
  //     return Center(child: CircularProgressIndicator()); // Loading state
  //   }

  //   // Define icons and colors based on the leave type
  //   Map<String, IconData> leaveIcons = {
  //     "Earned Leave": FontAwesomeIcons.calendarAlt,
  //     "Sick Time Off": FontAwesomeIcons.firstAid,
  //     "Casual Leave": FontAwesomeIcons.umbrellaBeach,
  //     // Add more icons for other leave types if necessary
  //   };

  //   Map<String, Color> leaveColors = {
  //     "Earned Leave": Colors.blue,
  //     "Sick Time Off": Colors.orange,
  //     "Casual Leave": Colors.green,
  //     // Add more colors for other leave types if necessary
  //   };

  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: leaveData
  //         .where((data) => leaveIcons.containsKey(data.leaveType))  // Only show supported leave types
  //         .map((data) {
  //       return LeavesummaryCard(
  //         icon: leaveIcons[data.leaveType] ?? FontAwesomeIcons.questionCircle,
  //         title: data.leaveType,
  //         value: data.leaveValue.toString(),
  //         color: leaveColors[data.leaveType] ?? Colors.grey,
  //       );
  //     }).toList(),
  //   );
  // }
}
