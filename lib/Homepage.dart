import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrms/BreakTimePerDayCard/break_time.dart';
import 'package:hrms/CheckInCard/checkIn.dart';
import 'package:hrms/CheckOutCard/checkOut.dart';
import 'package:hrms/CurrentLocationCard/location.dart';
import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
import 'package:hrms/UserProfileCard/userprofile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheckedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=b3549656830f67a14d3ffd3a5f0cf835d1b72214'
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

      // Extract access_token, secret_key, api_key from the response
      var accessToken = jsonResponse['access_token'];
      var secretKey = jsonResponse['secret_key'];
      var apiKey = jsonResponse['api_key'];

      // Store tokens securely
      final storage = const FlutterSecureStorage();
      await storage.write(key: 'access_token', value: accessToken);
      await storage.write(key: 'secret_key', value: secretKey);
      await storage.write(key: 'api_key', value: apiKey);

      print("Tokens stored successfully");
    } else {
      print(response.reasonPhrase);
    }
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile section
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
                        UserProfileCard(
                          name: 'Safayet Hossain',
                          job_id: 'Software Developer',
                        ),
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
              // Check-in and Check-out card section
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
                                isCheckedIn: isCheckedIn, employeeId: 1,
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
              // User Total days per month section
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
                                avgTime: 'Average Time 30', employeeId: 1,
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
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TotalDaysPerMonthCard(
                                totalDays: 22,
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
              // User current location section
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
  }
}
