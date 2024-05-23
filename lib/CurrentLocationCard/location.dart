import 'package:flutter/material.dart';

class CurrentLocationCard extends StatelessWidget {
  final String location;

  const CurrentLocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Location',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/location.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          location,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
