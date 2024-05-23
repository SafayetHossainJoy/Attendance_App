import 'package:flutter/material.dart';
import 'package:hrms/Login/Layer/layerone.dart';
import 'package:hrms/Login/Layer/layerthree.dart';
import 'package:hrms/Login/Layer/layertwo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/primaryBg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: screenSize.height * 0.2, // Adjust top position
              left: screenSize.width * 0.1, // Adjust left position
              child: Container(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.3, // Adjust top position
              right: 0,
              bottom: 0,
              child: LayerOne(),
            ),
            Positioned(
              top: screenSize.height * 0.32, // Adjust top position
              right: 0,
              bottom: screenSize.height * 0.02, // Adjust bottom position
              child: LayerTwo(),
            ),
            Positioned(
              top: screenSize.height * 0.325, // Adjust top position
              right: 0,
              bottom: screenSize.height * 0.04, // Adjust bottom position
              child: LayerThree(),
            ),
          ],
        ),
      ),
    );
  }
}
