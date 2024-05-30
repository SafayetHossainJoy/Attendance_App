import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hrms/BottomNavigation/bottomnav.dart';
import 'package:hrms/config.dart';

class LayerThree extends StatefulWidget {
  @override
  _LayerThreeState createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  bool isChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _authenticate() async {
    final String username = "admin";
    final String password = "1234";

    // Check if username or password is empty
    if (username.isEmpty || password.isEmpty) {
      _showAlertDialog('Error', 'Please enter both username and password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=9bed94b43d7e67f7c9a2eb7ec6801210473a517c'
    };
    var request = http.Request('POST', Uri.parse('https://odoo17e.xsellencebdltd.com/web/session/authenticate'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "db": "odoo17e",
        "login": username,
        "password": password
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      // Handle successful response here
      print(jsonResponse);
      _showAlertDialog('Success', 'Authentication successful');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Bottomnavi()),
      );
    } else {
      print(response.reasonPhrase);
      // Show error message
      _showAlertDialog('Error', 'Authentication failed: Invalid username or password');
    }
  }

  Future<void> _showAlertDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 59,
            top: 129,
            child: Container(
              width: 310,
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter User ID or Email',
                  hintStyle: TextStyle(color: hintText),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 59,
            top: 229,
            child: Container(
              width: 310,
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: hintText),
                ),
                obscureText: true,
              ),
            ),
          ),
          const Positioned(
            right: 60,
            top: 296,
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: forgotPasswordText,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 46,
            top: 361,
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: checkbox,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
          ),
          const Positioned(
            left: 87,
            top: 375,
            child: Text(
              'Remember Me',
              style: TextStyle(
                color: forgotPasswordText,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 60,
            child: InkWell(
              onTap: _isLoading ? null : _authenticate,
              child: Container(
                width: 99,
                height: 35,
                decoration: BoxDecoration(
                  color: _isLoading ? Colors.grey : signInButton,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
