// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LeaveCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String value;
//   final Color color;

//   LeaveCard({
//     required this.icon,
//     required this.title,
//     required this.value,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             FaIcon(icon, color: color, size: 30),
//             SizedBox(height: 4),
//             Text(title, style: TextStyle(fontSize: 18)),
//             SizedBox(height: 4),
//             Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaveCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  LeaveCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Getting screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: color, size: screenWidth * 0.07), // Icon size scales with screen width
            SizedBox(height: screenWidth * 0.02),
            Text(
              title,
              style: TextStyle(fontSize: screenWidth * 0.045), // Text scales with screen width
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.05, 
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
