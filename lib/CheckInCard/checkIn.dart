import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      setState(() {
        // Format the time in AM/PM format
        final formattedTime = DateFormat.jm().format(DateTime.now());
        checkInTime = formattedTime;
        isCheckedIn =
            true; // Update the flag to indicate check-in has been performed
        _updateStatus(); // Update status and statusColor after checking in
        readOnlyMode = true; // Set read-only mode after check-in
      });
      widget
          .onCheckIn(); // Notify the parent widget that check-in has been done
    } else {
      // You can display a message here indicating that check-in has already been done for today
      // For example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check-in has already been done for today.")));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    if (!isCheckedIn) {
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
