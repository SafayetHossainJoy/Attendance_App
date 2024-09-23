import 'package:flutter/material.dart';
import 'package:hrms/Login/login_service.dart';
import 'employee_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmployeeHistoryScreen extends StatefulWidget {
  @override
  EmployeeHistoryScreenState createState() => EmployeeHistoryScreenState();
}

class EmployeeHistoryScreenState extends State<EmployeeHistoryScreen> {
  
  Employee? employee;  // Employee object, can be null initially
  bool isLoading = true;  // Loading state
  bool hasError = false;  // Error state

  @override
  void initState() {
    super.initState();
    _fetchEmployeeData();  // Fetch employee data on initialization
  }

  /// Method to fetch employee data from API
  Future<void> _fetchEmployeeData() async {
  try {
    var headers = {
  'Content-Type': 'application/json',
  'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
    };

    var request = http.Request(
        'GET', Uri.parse('https://vxservice17.xsellencebdltd.com/api/employee/user'));

    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": auth.currentAccessToken,
        "secret_key": auth.currentSecretKey,
        "api_key": auth.currentApiKey,
        "user_id": auth.currentUserId
      }
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();

      // Print the raw response for debugging purposes
      print('Raw response: $responseBody');

      final jsonResponse = jsonDecode(responseBody);

      // Access the 'result' and 'employee' list inside it
      if (jsonResponse.containsKey('result') && jsonResponse['result'].containsKey('employee')) {
        List<dynamic> employeeList = jsonResponse['result']['employee'];  // Access the employee list

        if (employeeList.isNotEmpty) {
          setState(() {
            employee = Employee.fromJson(employeeList[0]);  // Parse the first employee object
            isLoading = false;
          });
        } else {
          print('No employee data found');
          setState(() {
            hasError = true;
            isLoading = false;
          });
        }
      } else {
        print('Error: "result" or "employee" key not found in response');
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } else {
      print(response.reasonPhrase);
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  } catch (e) {
    print('Error fetching employee data: $e');
    setState(() {
      hasError = true;
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Employee Details',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())  // Show loading spinner
            : hasError
                ? Center(child: Text('Error fetching employee data.'))
                : AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: employee != null
                        ? _buildEmployeeDetails()
                        : Center(child: Text('No employee data available.')),
                  ),
      ),
    );
  }

  /// Build the employee details UI
  Widget _buildEmployeeDetails() {
    return ListView(
      key: ValueKey(employee),  // Unique key for AnimatedSwitcher
      children: [
        _buildProfileCard(),
        SizedBox(height: 16),
        _buildSectionHeader('Contact Information'),
        _buildDetailItem(Icons.phone, 'Work Phone', employee!.workPhone),
        _buildDetailItem(Icons.email, 'Work Email', employee!.workEmail),
        Divider(),
        _buildSectionHeader('Personal Information'),
        _buildDetailItem(Icons.badge, 'Employee ID', employee!.employeeId),
        _buildDetailItem(Icons.person, 'Gender', employee?.gender.toString().split('.').last ?? 'N/A'),  // Convert enum to string
        _buildDetailItem(Icons.credit_card, 'NID', employee!.nid?.toString() ?? 'N/A'),
        _buildDetailItem(Icons.bloodtype, 'Blood Group', employee?.bloodGroup.toString().split('.').last ?? 'N/A'),  // Convert enum to string
        Divider(),
        _buildSectionHeader('Job Details'),
        _buildDetailItem(Icons.business, 'Department', employee?.department ?? 'N/A'),
        _buildDetailItem(Icons.work, 'Job Position', employee?.jobPosition ?? 'N/A'),
        _buildDetailItem(Icons.supervisor_account, 'Manager', employee!.manager),
        Divider(),
        _buildSectionHeader('Work Information'),
        _buildDetailItem(Icons.location_on, 'Work Address', employee!.workAddress),
        _buildDetailItem(Icons.location_city, 'Work Location', employee!.workLocation),
        _buildDetailItem(Icons.calendar_today, 'Joining Date', _formatDate(employee?.joiningDate)),
        _buildDetailItem(Icons.upgrade, 'Promotion Date',
            employee?.promotionDate != null ? _formatDate(employee!.promotionDate!) : 'N/A'),
        _buildDetailItem(Icons.exit_to_app, 'Separation Date',
             employee?.separationDate != null ? _formatDate(employee!.separationDate!) : 'N/A'),
        _buildDetailItem(Icons.schedule, 'Working Hours', employee!.workingHours),
      ],
    );
  }

  /// Build the profile card for the employee
  Widget _buildProfileCard() {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: employee?.image != null && employee!.image.isNotEmpty
                ? NetworkImage(employee!.image) as ImageProvider  // Use network image if available
                : AssetImage('assets/images/com.png'),  // Placeholder image if no network image
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee?.name ?? 'N/A',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                employee?.jobPosition ?? 'N/A',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                employee?.department ?? 'N/A',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

  // Widget _buildProfileCard() {
  //   return Card(
  //     elevation: 4.0,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Row(
  //         children: [
  //           CircleAvatar(
  //             radius: 40,
  //             backgroundImage: 
  //             employee?.image != null
  //                 ? NetworkImage(employee!.image): AssetImage('assets/images/com.png'), 
  //           // AssetImage('assets/images/com.png'), // Placeholder image
  //           ),
  //           SizedBox(width: 16),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 employee!.name,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(height: 4),
  //               Text(
  //                 employee!.jobPosition,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Color.fromARGB(221, 82, 81, 81),
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(height: 4),
  //               Text(
  //                 employee!.department,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.grey[600],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper method to format DateTime
  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}
