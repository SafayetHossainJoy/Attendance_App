import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CheckInButton extends StatefulWidget {
  final String checkDate;
  final VoidCallback onCheckIn;

  const CheckInButton({
    Key? key,
    required this.checkDate,
    required this.onCheckIn,
  }) : super(key: key);

  @override
  _CheckInButtonState createState() => _CheckInButtonState();
}

class _CheckInButtonState extends State<CheckInButton> {
  String checkInTime = 'Not yet checked in';
  late DateTime selectedDate;
  late Color statusColor;
  late String status;
  bool isCheckedIn = false; // Flag to track if check-in has been performed
  bool readOnlyMode = false; // Flag to track read-only mode

  Future<void> _checkIn() async {
    final url = Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/attendance/check_in');
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=3073f115ac1a6605d09a436c0eea41c5d65b8316'
    };
    final body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "9551f604-d70c-47e2-bc54-95a0188691d9",
        "secret_key": "4aa3e03ba43738ff4023dbc8657e026c",
        "api_key": "40852880ca39efe757f42ed91655680f",
        "employee_id": "1",
        "check_in": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        "in_latitude": "23.7529855",
        "in_longitude": "90.4378656",
        "in_country_name": "Bangladesh",
        "in_city": "Dhaka",
        "in_ip_address": "",
        "in_browser": "Android"
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Check-in successful');
      setState(() {
        final formattedTime = DateFormat.jm().format(DateTime.now());
        checkInTime = formattedTime;
        isCheckedIn = true;
        _updateStatus();
        readOnlyMode = true;
      });
      widget.onCheckIn();
    } else {
      print('Check-in failed: ${response.reasonPhrase}');
      // Handle error, show message to user, etc.
    }
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.checkDate);
    _updateStatus(); // Initialize status and statusColor
  }

  void _updateStatus() {
    final now = DateTime.now();
    if (now.hour == 9 && now.minute >= 0 && now.minute <= 59) {
      status = 'Early Check-In';
      statusColor = Colors.blue;
    } else if (now.hour == 10 && now.minute >= 0 && now.minute <= 14) {
      status = 'On Time';
      statusColor = Colors.green;
    } else {
      status = 'Late';
      statusColor = Colors.red;
    }
  }

  void _setCheckInTime() {
    if (!isCheckedIn) {
      _checkIn();
    } else {
      // You can display a message here indicating that check-in has already been done for today
      // For example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check-in has already been done for today.")));
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
            onTap: readOnlyMode ? null : _setCheckInTime,
            child: Row(
              children: [
                const Text(
                  'Check In',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: readOnlyMode ? null : _setCheckInTime,
                  child: Icon(
                    Icons.check_circle,
                    color: readOnlyMode
                        ? Colors.grey
                        : const Color.fromARGB(202, 72, 224, 151),
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
              color: isCheckedIn ? Colors.grey : Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Check-In',
            style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
          ),
          const SizedBox(width: 10),
          Text(
            checkInTime,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
          if (isCheckedIn) ...[
            const SizedBox(height: 10),
            Text(
              'Status',
              style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Roboto'),
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: statusColor,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
