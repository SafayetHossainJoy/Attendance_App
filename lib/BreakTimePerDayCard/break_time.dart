import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BreakTimePerDayCard extends StatefulWidget {
  final String avgTime;
  final int employeeId; // Add employeeId as a parameter

  const BreakTimePerDayCard({
    Key? key,
    required this.avgTime,
    required this.employeeId, required String breakTime, // Initialize employeeId
  }) : super(key: key);

  @override
  _BreakTimePerDayCardState createState() => _BreakTimePerDayCardState();
}

class _BreakTimePerDayCardState extends State<BreakTimePerDayCard> {
  bool isOnBreak = false;
  DateTime? breakStartTime;
  int breakDuration = 0; // in minutes
  int totalBreaks = 0;
  int totalBreakDuration = 0;

  Future<void> startBreak() async {
    setState(() {
      isOnBreak = true;
      breakStartTime = DateTime.now();
    });

    final url = Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/breaktime/employee');
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=7b111f1dba603cb9b9343918d81942386495fdd6'
    };
    final body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "employee_id": widget.employeeId, // Use the employeeId from the widget
        "break_start": DateFormat('yyyy-MM-dd HH:mm:ss').format(breakStartTime!),
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Break started successfully');
    } else {
      print('Failed to start break: ${response.reasonPhrase}');
      Fluttertoast.showToast(
        msg: "Failed to start break. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> endBreak() async {
    final breakEndTime = DateTime.now();
    final duration = breakEndTime.difference(breakStartTime!);
    setState(() {
      isOnBreak = false;
      breakDuration = duration.inMinutes;
      totalBreakDuration += breakDuration;
      totalBreaks++;
    });

    final url = Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/breaktime/employee');
    final headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=7b111f1dba603cb9b9343918d81942386495fdd6'
    };
    final body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "employee_id": widget.employeeId, // Use the employeeId from the widget
        "break_start": DateFormat('yyyy-MM-dd HH:mm:ss').format(breakStartTime!),
        "break_end": DateFormat('yyyy-MM-dd HH:mm:ss').format(breakEndTime),
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Break ended successfully');
    } else {
      print('Failed to end break: ${response.reasonPhrase}');
      Fluttertoast.showToast(
        msg: "Failed to end break. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isOnBreak) ...[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  startBreak();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/BTime.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Break Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        if (isOnBreak) ...[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  endBreak();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/BTime.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'End Break',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
            children: [
              TextSpan(
                text: '${isOnBreak ? 'Running' : '$breakDuration minutes'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
            children: [
              const TextSpan(
                text: 'Average Time: ',
              ),
              TextSpan(
                text:
                    '${totalBreaks == 0 ? '0' : (totalBreakDuration / totalBreaks).toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: ' minutes',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

