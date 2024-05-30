import 'package:flutter/material.dart';

class TotalDaysPerMonthCard extends StatelessWidget {
  final int totalDays;

  const TotalDaysPerMonthCard({
    Key? key,
    required this.totalDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/Days.png', // Replace 'custom_icon.png' with your custom icon asset path
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 5),
            const Text(
              'Total Days',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          totalDays.toString(),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Working Days',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}



// lib/total_days_per_month_card.dart
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class TotalDaysPerMonthCard extends StatefulWidget {
//   @override
//   _TotalDaysPerMonthCardState createState() => _TotalDaysPerMonthCardState();
// }

// class _TotalDaysPerMonthCardState extends State<TotalDaysPerMonthCard> {
//   int totalDays = 0;
//   bool isLoading = true;
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchTotalDays();
//   }

//   Future<void> fetchTotalDays() async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie': 'frontend_lang=en_US; session_id=1b30dd948595daf65431b1fafdc85ddb781f5de3'
//     };
//     var request = http.Request('GET', Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/employee/working_days/employee'));
//     request.body = json.encode({
//       "jsonrpc": "2.0",
//       "params": {
//         "access_token": "9551f604-d70c-47e2-bc54-95a0188691d9",
//         "secret_key": "4aa3e03ba43738ff4023dbc8657e026c",
//         "api_key": "40852880ca39efe757f42ed91655680f",
//         "employee_id": "1"
//       }
//     });
//     request.headers.addAll(headers);

//     try {
//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         String responseBody = await response.stream.bytesToString();
//         var data = json.decode(responseBody);
//         setState(() {
//           totalDays = data['result']['total_days'];
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Error: ${response.reasonPhrase}';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Error: $e';
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : errorMessage.isNotEmpty
//             ? Center(child: Text(errorMessage))
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/Days.png', // Replace 'custom_icon.png' with your custom icon asset path
//                         width: 24,
//                         height: 24,
//                       ),
//                       const SizedBox(width: 5),
//                       const Text(
//                         'Total Days',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Roboto',
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     totalDays.toString(),
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     'Working Days',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey[600],
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                 ],
//               );
//   }
// }
