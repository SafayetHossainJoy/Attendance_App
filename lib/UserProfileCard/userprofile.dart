import 'package:flutter/material.dart';
import 'package:hrms/UserProfileCard/userProfile_model.dart';

class UserProfileCard extends StatelessWidget {
  final UserProfile? userProfile;

  const UserProfileCard({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userProfile == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userProfile!.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                userProfile!.jobId,
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
        CircleAvatar(
          radius: 40, // Adjust the size of the avatar as needed
          backgroundImage: NetworkImage(userProfile!.image), // Replace with your image asset
        ),
      ],
    );
  }
}
