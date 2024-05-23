import 'package:flutter/material.dart';

class TotalDaysPerMonthCard extends StatelessWidget {
  final int totalDays;

  const TotalDaysPerMonthCard({
    Key? key,
    required this.totalDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/Days.png', // Replace 'custom_icon.png' with your custom icon asset path
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 5),
            const Text(
              'Total Days',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          totalDays.toString(),
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
}
