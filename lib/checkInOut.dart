import 'package:hrms/Models/checkInOut_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckInOutListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch check-in/check-out records for the last month
    List<CheckInOutRecord> records = fetchCheckInOutRecordsForLastMonth();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the leading widget
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        elevation: 2,
        title: const Text(
          'Safayet Hossain',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (BuildContext context, int index) {
          final record = records[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  '${DateFormat('dd MMMM yyyy').format(record.checkInTime)}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue[900],
                  ),
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.arrow_forward, color: Colors.green), // Attractive icon for check-in
                    const SizedBox(width: 5),
                    Text(
                      '${DateFormat('hh:mm a').format(record.checkInTime)}', // Format check-in time with AM/PM
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const Spacer(), // Add space between icons and times
                    const Icon(Icons.arrow_back, color: Colors.red), // Attractive icon for check-out
                    const SizedBox(width: 5),
                    Text(
                      '${DateFormat('hh:mm a').format(record.checkOutTime)}', // Format check-out time with AM/PM
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                tileColor: Colors.grey[100], // Background color for each list item
              ),
            ),
          );
        },
      ),
    );
  }
}
