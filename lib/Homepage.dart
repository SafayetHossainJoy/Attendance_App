import 'package:flutter/material.dart';
import 'package:hrms/BreakTimePerDayCard/break_time.dart';
import 'package:hrms/CheckInCard/checkIn.dart';
import 'package:hrms/CheckOutCard/checkOut.dart';
import 'package:hrms/CurrentLocationCard/location.dart';
import 'package:hrms/TotalDaysPerMonthCard/workingdays.dart';
import 'package:hrms/UserProfileCard/userprofile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool isCheckedIn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100], // Set screen background color to grey
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the leading widget
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Attendance Details',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
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
                  color: Colors.white, // Set card background color to white
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
                          userName: 'Safayet Hossain',
                          jobPosition: 'Software Developer',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Today Attendance',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
              ),
              const SizedBox(height: 20),
              // Check-in and Check-out card section
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.white, // Set card background color to white
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
                    const SizedBox(width: 5), // Add some spacing between the cards
                    Expanded(
                      child: Card(
                        color: Colors.white, // Set card background color to white
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
                                avgTime: 'Average Time 30',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 5), // Add space between the cards
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
                              TotalDaysPerMonthCard(
                                totalDays: 26,
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
                  color: Colors.white, // Set card background color to white
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
      // Bottom Navigation Bar

    );
  }
}
