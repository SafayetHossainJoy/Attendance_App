import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutButton extends StatefulWidget {
  final String checkDate;
  final bool isCheckedIn;

  const CheckOutButton({
    Key? key,
    required this.checkDate,
    required this.isCheckedIn,
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

  void _setCheckOutTime() {
    if (widget.isCheckedIn && !isCheckedOut) {
      setState(() {
        checkOutTime =
            DateFormat.jm().format(DateTime.now()); // Format time to AM/PM
        isCheckedOut =
            true; // Update the flag to indicate check-out has been performed
        readOnlyMode = true; // Enable read-only mode after check-out
      });
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
            onTap: readOnlyMode
                ? null
                : _setCheckOutTime, // Disable onTap when in read-only mode
            child: Row(
              children: [
                const Text(
                  'Check Out',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: readOnlyMode
                      ? null
                      : _setCheckOutTime, // Disable onTap when in read-only mode
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
          // Disable the InkWell if isCheckedOut is true
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
