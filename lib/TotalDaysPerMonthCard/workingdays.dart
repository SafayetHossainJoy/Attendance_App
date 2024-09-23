// import 'package:flutter/material.dart';
// import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';

// class MonthCardPerTotalWDays extends StatelessWidget {
//   final WorkingDays? workingDays;

//   const MonthCardPerTotalWDays({
//     Key? key,
//     required this.workingDays,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (workingDays == null) {
//       return Center(child: CircularProgressIndicator());
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Image.asset(
//               'assets/images/Days.png',
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(width: 5),
//             const Text(
//               'Total Days',
//               style: const TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Text(
//           workingDays!.days.toString(), // Ensure workingDays is not null
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Roboto',
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           'Working Days',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.grey[600],
//             fontFamily: 'Roboto',
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';

class MonthCardPerTotalWDays extends StatelessWidget {
  final WorkingDays? workingDays;

  const MonthCardPerTotalWDays({
    Key? key,
    required this.workingDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (workingDays == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 10),
        Text(
          workingDays!.days.toStringAsFixed(1),  // Limit to 1 decimal place
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Working Days',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }

  // Method to build the header row
  Row _buildHeader() {
    return Row(
      children: [
        Image.asset(
          'assets/images/Days.png',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 5),
        const Text(
          'Total Days',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
