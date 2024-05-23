import 'package:hrms/BottomNavigation/bottomnav.dart';
import 'package:hrms/config.dart';
import 'package:flutter/material.dart';

class LayerThree extends StatefulWidget {
  @override
  _LayerThreeState createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  bool isChecked = false;

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
              child: const TextField(
                decoration: InputDecoration(
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
              child: const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: hintText),
                ),
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
              onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Bottomnavi()),
            );
          },
              child: Container(
                width: 99,
                height: 35,
                decoration: const BoxDecoration(
                  color: signInButton,
                  borderRadius: BorderRadius.only(
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
