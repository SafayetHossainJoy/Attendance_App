import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String job_id;

  const UserProfileCard({
    Key? key,
    required this.name,
    required this.job_id,
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
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                job_id,
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
        const CircleAvatar(
          radius: 40, // Adjust the size of the avatar as needed
          backgroundImage: AssetImage(
            'assets/images/com.png', // Replace with your image asset
          ),
        ),
      ],
    );
  }
}
