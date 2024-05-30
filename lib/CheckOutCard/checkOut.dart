import 'dart:convert';
import 'package:flutter/material.dart';
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
    required this.employeeId
  }) : super(key: key);

  @override
  _CheckOutButtonState createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  String checkOutTime = 'Not yet checked out';
  late DateTime selectedDate;
  bool isCheckedOut = false; // Flag to track if check-out has been performed
  bool readOnlyMode = false; // Flag to track if the button should be read-only

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.checkDate);
  }

  Future<void> _checkOut() async {
    final url = Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/attendance/check_out');
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
        "employee_id": widget.employeeId,
        "check_out": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        "out_latitude": "23.7529855",
        "out_longitude": "90.4378656",
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
      // Show toast message indicating that check-out cannot be performed until check-in is done
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
      // Show toast message indicating that user has already checked out
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
                    color: readOnlyMode
                        ? Colors.grey
                        : const Color.fromARGB(197, 241, 45, 45),
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
                fontFamily: 'Roboto'),
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
