// import 'package:flutter/material.dart';

// class GridItem extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final Color color;

//   const GridItem({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
//       elevation: 2.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Poppins-Medium',
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Poppins-Medium',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }