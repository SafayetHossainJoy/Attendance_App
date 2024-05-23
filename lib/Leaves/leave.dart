// import 'package:hrms/BottomNavigation/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApplyForLeavePage extends StatefulWidget {
  @override
  _ApplyForLeavePageState createState() => _ApplyForLeavePageState();
}

class _ApplyForLeavePageState extends State<ApplyForLeavePage> {
  late String _title = '';
  String _selectedLeaveType = 'Casual Leave';
  late String _contact = '';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _reason = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController(text: _formatDate(_startDate));
    _endDateController = TextEditingController(text: _formatDate(_endDate));
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate = isStartDate ? _startDate : _endDate;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate.isAfter(now) ? initialDate : now,
      firstDate: isStartDate ? now : _startDate,
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
          _startDateController.text = _formatDate(_startDate);
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate; // Set end date equal to start date
            _endDateController.text = _formatDate(_endDate);
          }
        } else {
          if (pickedDate.isBefore(_startDate)) {
            _endDate = _startDate; // Set end date equal to start date
            _endDateController.text = _formatDate(_endDate);
          } else {
            _endDate = pickedDate;
            _endDateController.text = _formatDate(_endDate);
          }
        }
      });
    }
  }

  final OutlineInputBorder _blackBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  final OutlineInputBorder _blackFocusedBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  );

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, implement your logic here
      // For example, you can print the form data
      print('Title: $_title');
      print('Leave Type: $_selectedLeaveType');
      print('Contact Number: $_contact');
      print('Start Date: $_startDate');
      print('End Date: $_endDate');
      print('Reason for Leave: $_reason');

      // Show toast message
      Fluttertoast.showToast(
        msg: 'Leave submitted successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Refresh the page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ApplyForLeavePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the leading widget

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Apply for Leave',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  border: _blackBorder,
                  focusedBorder: _blackFocusedBorder,
                  prefixIcon: const Icon(Icons.title, color: Colors.blue),
                ),
                onChanged: (value) {
                  _title = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Leave Type',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedLeaveType,
                onChanged: (value) {
                  setState(() {
                    _selectedLeaveType = value!;
                  });
                },
                items: ['Casual Leave', 'Sick Leave', 'Monthly Leave', 'Half Day Leave']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        const Icon(Icons.home_repair_service, color: Colors.green),
                        const SizedBox(width: 8.0),
                        Text(
                          value,
                          style: const TextStyle(fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: _blackBorder,
                  focusedBorder: _blackFocusedBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Leave Type is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Number',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontFamily: 'Roboto'),
                decoration: InputDecoration(
                  hintText: 'Enter number',
                  border: _blackBorder,
                  focusedBorder: _blackFocusedBorder,
                  prefixIcon: const Icon(Icons.phone, color: Colors.orange),
                ),
                onChanged: (value) {
                  _contact = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact Number is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _startDateController,
                        readOnly: true,
                        style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                        decoration: InputDecoration(
                          border: _blackBorder,
                          focusedBorder: _blackFocusedBorder,
                          prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _endDateController,
                        readOnly: true,
                        style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                        decoration: InputDecoration(
                          border: _blackBorder,
                          focusedBorder: _blackFocusedBorder,
                          prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Reason for Leave',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                //maxLines: 3,
                style: const TextStyle(fontFamily: 'Roboto'),
                decoration: InputDecoration(
                  hintText: 'Enter reason',
                  border: _blackBorder,
                  focusedBorder: _blackFocusedBorder,
                  prefixIcon: const Icon(Icons.comment_outlined, color: Colors.purple),
                ),
                onChanged: (value) {
                  setState(() {
                    _reason = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Reason for Leave is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
    //  bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

