import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/UserProfileCard/model.dart';
import 'package:http/http.dart' as http;

class UserProfileCard extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileCard({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userProfile.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                userProfile.jobId,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10), // Add some space between the image and text
        CircleAvatar(
          radius: 40, // Adjust the size of the avatar as needed
          backgroundImage: NetworkImage(userProfile.image), // Replace with your image asset
        ),
      ],
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  bool isLoading = true;
  late final UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
    };
    var request = http.Request('GET', Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/employee/user'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "user_id": 2 // Ensure this is an integer if expected by the API
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      try {
        String responseString = await response.stream.bytesToString();
        print('Response body: $responseString'); // Debug: Print the response body

        Map<String, dynamic> responseData = json.decode(responseString);
        print('Response data: $responseData'); // Debug: Print the parsed response data

        // Parse the response data to extract user details
        List<dynamic> result = json.decode(responseData['result']);
        var userDetails = result[0];
        
        setState(() {
          userProfile = UserProfile.fromJson(userDetails);
          isLoading = false;
        });
      } catch (e) {
        print('Error parsing response: $e');
        Fluttertoast.showToast(
          msg: "Failed to load user profile. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('Request failed: ${response.reasonPhrase}');
      Fluttertoast.showToast(
        msg: "Failed to load user profile. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  UserProfileCard(userProfile: userProfile),
      ),
    );
  }
}
