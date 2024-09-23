// // import 'package:flutter/material.dart';

// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<double> _opacityAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 1500),
// //     );

// //     _opacityAnimation = Tween<double>(
// //       begin: 0,
// //       end: 1,
// //     ).animate(
// //       CurvedAnimation(
// //         parent: _animationController,
// //         curve: Curves.easeInOut,
// //       ),
// //     );

// //     _animationController.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white, // White background
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             // Animated logo
// //             FadeTransition(
// //               opacity: _opacityAnimation,
// //               child: Container(
// //                 width: 150,
// //                 height: 150,
// //                 decoration: BoxDecoration(
// //                   image: DecorationImage(
// //                     image: AssetImage("assets/images/com.png"), // Replace with your logo image
// //                     fit: BoxFit.contain,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             // Animated text with stylish font
// //             FadeTransition(
// //               opacity: _opacityAnimation,
// //               child: Text(
// //                 "Attendance App",
// //                 style: TextStyle(
// //                   fontFamily: 'Montserrat',
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black87,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:async';
import 'package:hrms/BottomNavigation/bottomnav.dart';
import 'package:hrms/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:hrms/Login/login_service.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if (auth.currentUserId.isEmpty) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => LoginPage(),
            ),
          );
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Bottomnavi()),
              (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Colors.white, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.6, // Adjust height based on screen size
                child: FractionallySizedBox(
                  widthFactor: 0.6, // Adjust width factor as needed
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Reduced gap
              SizedBox(
                height: screenHeight * 0.2, // Adjust height based on screen size
                child: FractionallySizedBox(
                  widthFactor: 0.2, // Adjust width factor as needed
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.network(
                          "https://lottie.host/76bbb7c4-07e5-4c52-89a6-c9523fc5b5e5/A78TDs9WH9.json",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
