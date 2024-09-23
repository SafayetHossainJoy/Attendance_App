// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:hrms/UserProfileCard/userProfile_model.dart';

// // // // // // class UserProfileCard extends StatelessWidget {
// // // // // //   final UserProfile? userProfile; 

// // // // // //   const UserProfileCard({
// // // // // //     Key? key,
// // // // // //     this.userProfile, 
// // // // // //   }) : super(key: key);

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     if (userProfile == null) {
// // // // // //       return Center(child: CircularProgressIndicator());
// // // // // //     }

// // // // // //     return Row(
// // // // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //       children: [
// // // // // //         Expanded(
// // // // // //           child: Column(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               Text(
// // // // // //                 userProfile!.name,
// // // // // //                 style: TextStyle(
// // // // // //                   fontSize: 24,
// // // // // //                   fontWeight: FontWeight.bold,
// // // // // //                   fontFamily: 'Roboto',
// // // // // //                   color: Colors.blue[900],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 5),
// // // // // //               Text(
// // // // // //                 userProfile!.jobPosition,
// // // // // //                 style: TextStyle(
// // // // // //                   fontSize: 20,
// // // // // //                   fontFamily: 'Roboto',
// // // // // //                   color: Colors.grey[600],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //         const SizedBox(width: 10), // Add some space between the image and text
// // // // // //         CircleAvatar(
// // // // // //           radius: 40, // Adjust the size of the avatar as needed
// // // // // //           backgroundImage: NetworkImage(userProfile!.image), // Replace with your image asset
// // // // // //         ),
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:flutter/material.dart';

// // // // // import 'userProfile_model.dart';


// // // // // class UserProfileCard extends StatelessWidget {
// // // // //   final UserProfile? userProfile;

// // // // //   const UserProfileCard({
// // // // //     Key? key,
// // // // //     this.userProfile,
// // // // //   }) : super(key: key);

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     if (userProfile == null) {
// // // // //       return const Center(child: CircularProgressIndicator());
// // // // //     }

// // // // //     return Row(
// // // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // //       children: [
// // // // //         Expanded(
// // // // //           child: Column(
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               Text(
// // // // //                 userProfile!.name,
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 24,
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                   fontFamily: 'Roboto',
// // // // //                   color: Colors.blue[900],
// // // // //                 ),
// // // // //               ),
// // // // //               const SizedBox(height: 5),
// // // // //               Text(
// // // // //                 userProfile!.jobPosition ?? 'Position not available', // Fallback for null job position
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 20,
// // // // //                   fontFamily: 'Roboto',
// // // // //                   color: Colors.grey[600],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //         const SizedBox(width: 10), // Add some space between the image and text
// // // // //         CircleAvatar(
// // // // //           radius: 40, // Adjust the size of the avatar as needed
// // // // //           backgroundImage: userProfile!.image != null
// // // // //               ? NetworkImage(userProfile!.image)
// // // // //               : const AssetImage('assets/images/p10.png') as ImageProvider, // Fallback for null image
// // // // //           onBackgroundImageError: (error, stackTrace) {
// // // // //             // Handle image loading error
// // // // //             print('Error loading image: $error');
// // // // //           },
// // // // //         ),
// // // // //       ],
// // // // //     );
// // // // //   }
// // // // // }


// // // // import 'package:flutter/material.dart';
// // // // import 'package:hrms/UserProfileCard/userProfile_model.dart';

// // // // class UserProfileCard extends StatelessWidget {
// // // //   final UserProfile? userProfile;

// // // //   const UserProfileCard({
// // // //     Key? key,
// // // //     this.userProfile,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     if (userProfile == null) {
// // // //       return const Center(child: CircularProgressIndicator());
// // // //     }

// // // //     return Row(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Expanded(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Text(
// // // //                 userProfile!.name,
// // // //                 style: TextStyle(
// // // //                   fontSize: 24,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   fontFamily: 'Roboto',
// // // //                   color: Colors.blue[900],
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 5),
// // // //               Text(
// // // //                 userProfile!.jobPosition ?? 'Position not available',
// // // //                 style: TextStyle(
// // // //                   fontSize: 20,
// // // //                   fontFamily: 'Roboto',
// // // //                   color: Colors.grey[600],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //         const SizedBox(width: 10),
// // // //         CircleAvatar(
// // // //           radius: 40,
// // // //           backgroundImage: userProfile!.image != null
// // // //               ? NetworkImage(userProfile!.image)
// // // //               : const AssetImage('assets/images/p10.png') as ImageProvider,
// // // //           onBackgroundImageError: (error, stackTrace) {
// // // //             print('Error loading image: $error');
// // // //           },
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }


// import 'package:flutter/material.dart';
// import 'userProfile_model.dart';

// // // class UserProfileCard extends StatelessWidget {
// // //   final UserProfile? userProfile;

// // //   const UserProfileCard({
// // //     Key? key,
// // //     this.userProfile,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (userProfile == null) {
// // //       return const Center(child: CircularProgressIndicator());
// // //     }

// // //     return Row(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Expanded(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // Display user name
// // //               Text(
// // //                 userProfile!.name,
// // //                 style: TextStyle(
// // //                   fontSize: 24,
// // //                   fontWeight: FontWeight.bold,
// // //                   fontFamily: 'Roboto',
// // //                   color: Colors.blue[900],
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 5),
// // //               // Display job position
// // //               Text(
// // //                 userProfile!.jobPosition,
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   fontFamily: 'Roboto',
// // //                   color: Colors.grey[600],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //         const SizedBox(width: 10),
// // //         // Display user image
// // //         CircleAvatar(
// // //           radius: 40,
// // //           backgroundImage: userProfile!.image != null
// // //               ? NetworkImage(userProfile!.image)
// // //               : const AssetImage('assets/images/p10.png') as ImageProvider,
// // //           onBackgroundImageError: (error, stackTrace) {
// // //             print('Error loading image: $error');
// // //           },
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'package:hrms/UserProfileCard/userProfile_model.dart';


// // class UserProfileCard extends StatelessWidget {
// //   final UserProfile? userProfile;

// //   const UserProfileCard({
// //     Key? key,
// //     this.userProfile,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     if (userProfile == null) {
// //       return const Center(child: CircularProgressIndicator());
// //     }

// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 userProfile!.name,
// //                 style: TextStyle(
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                   fontFamily: 'Roboto',
// //                   color: Colors.blue[900],
// //                 ),
// //               ),
// //               const SizedBox(height: 5),
// //               Text(
// //                 userProfile!.jobPosition ?? 'Position not available',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontFamily: 'Roboto',
// //                   color: Colors.grey[600],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const SizedBox(width: 10),
// //         CircleAvatar(
// //           radius: 40,
// //           backgroundImage: userProfile!.image != null
// //               ? NetworkImage(userProfile!.image)
// //               : const AssetImage('assets/images/p10.png') as ImageProvider,
// //           onBackgroundImageError: (error, stackTrace) {
// //             print('Error loading image: $error');
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }
// class UserProfileCard extends StatelessWidget {
//   final UserProfile? userProfile;

//   const UserProfileCard({
//     Key? key,
//     this.userProfile,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (userProfile == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 userProfile!.name.toString(),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Roboto',
//                   color: Colors.blue[900],
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 userProfile!.jobPosition ?? 'Position not available', // Fallback for null job position
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Roboto',
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 10),
//         CircleAvatar(
//           radius: 40,
//           backgroundImage: userProfile!.image.isNotEmpty
//               ? NetworkImage(userProfile!.image)
//               : const AssetImage('assets/images/p10.png') as ImageProvider,
//           onBackgroundImageError: (error, stackTrace) {
//             print('Error loading image: $error');
//           },
//         ),
//       ],
//     );
//   }
// }
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
          backgroundImage: NetworkImage(userProfile!.image1920), // Replace with your image asset
        ),
      ],
    );
  }
}
