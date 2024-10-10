import 'package:flutter/material.dart';



class CheckInOutScreen extends StatefulWidget {
  @override
  _CheckInOutScreenState createState() => _CheckInOutScreenState();
}

class _CheckInOutScreenState extends State<CheckInOutScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  TimeOfDay? _checkInTime;
  TimeOfDay? _checkOutTime;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInTime = picked;
        } else {
          _checkOutTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-in & Check-out Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Check-in Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(_checkInDate == null
                    ? 'No date selected'
                    : _checkInDate.toString().split(' ')[0]),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: Text('Pick Date'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Select Check-in Time (Optional)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(_checkInTime == null
                    ? 'No time selected'
                    : _checkInTime!.format(context)),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context, true),
                  child: Text('Pick Time'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Check-out Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(_checkOutDate == null
                    ? 'No date selected'
                    : _checkOutDate.toString().split(' ')[0]),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: Text('Pick Date'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Select Check-out Time (Optional)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(_checkOutTime == null
                    ? 'No time selected'
                    : _checkOutTime!.format(context)),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context, false),
                  child: Text('Pick Time'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle submission
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Request Submitted'),
                      ));
                    },
                    child: Text('Submit Request'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _checkInDate = null;
                        _checkOutDate = null;
                        _checkInTime = null;
                        _checkOutTime = null;
                      });
                    },
                    child: Text('Reset'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
