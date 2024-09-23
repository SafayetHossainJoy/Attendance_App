// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:hrms/CurrentLocationCard/location_service.dart';

// // class CurrentLocationCard extends StatefulWidget {
// //   @override
// //   _CurrentLocationCardState createState() => _CurrentLocationCardState();
// // }

// // class _CurrentLocationCardState extends State<CurrentLocationCard> {
// //   String? _currentLocation;
// //   String? _currentAddress;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchLocation();
// //   }

// //   Future<void> _fetchLocation() async {
// //     try {
// //       Position position = await LocationService().getCurrentLocation();
// //       String address = await LocationService().getAddressFromLatLng(position);
// //       setState(() {
// //         _currentLocation = '${position.latitude}, ${position.longitude}';
// //         _currentAddress = address;
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _currentLocation = 'Failed to get location: $e';
// //         _currentAddress = '';
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Row(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Current Location',
// //               style: TextStyle(
// //                 fontSize: 24.0,
// //                 fontWeight: FontWeight.bold,
// //                 fontFamily: 'Roboto',
// //                 color: Colors.blue[900],
// //               ),
// //             ),
// //             const SizedBox(width: 5),
// //             Expanded(
// //               child: Align(
// //                 alignment: Alignment.topLeft,
// //                 child: Image.asset(
// //                   'assets/images/location.png',
// //                   width: 24,
// //                   height: 24,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 10),
// //         Text(
// //           _currentLocation ?? 'Fetching location...',
// //           style: const TextStyle(
// //             fontSize: 18,
// //             fontFamily: 'Roboto',
// //             color: Colors.black87,
// //           ),
// //         ),
// //         const SizedBox(height: 10),
// //         Text(
// //           _currentAddress ?? 'Fetching address...',
// //           style: const TextStyle(
// //             fontSize: 18,
// //             fontFamily: 'Roboto',
// //             color: Colors.black87,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:hrms/CurrentLocationCard/location_service.dart';

// class CurrentLocationCard extends StatefulWidget {
//   @override
//   _CurrentLocationCardState createState() => _CurrentLocationCardState();
// }

// class _CurrentLocationCardState extends State<CurrentLocationCard> {
//   String? _currentLocation;
//   String? _currentAddress;
//   String? _placeName;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLocation();
//   }

//   Future<void> _fetchLocation() async {
//     try {
//       Position position = await LocationService().getCurrentLocation();
//       String address = await LocationService().getAddressFromLatLng(position);
//       List<String> addressParts = address.split(', ');
//       String placeName = addressParts[0];

//       setState(() {
//         _currentLocation = '${position.latitude}, ${position.longitude}';
//         _currentAddress = address;
//         _placeName = placeName;
//       });
//     } catch (e) {
//       setState(() {
//         _currentLocation = 'Failed to get location: $e';
//         _currentAddress = '';
//         _placeName = '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Current Location',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Roboto',
//                 color: Colors.blue[900],
//               ),
//             ),
//             const SizedBox(width: 5),
//             Expanded(
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset(
//                   'assets/images/location.png',
//                   width: 24,
//                   height: 24,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Text(
//           _currentLocation ?? 'Fetching location...',
//           style: const TextStyle(
//             fontSize: 18,
//             fontFamily: 'Roboto',
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           _placeName ?? 'Fetching place name...',
//           style: const TextStyle(
//             fontSize: 18,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           _currentAddress ?? 'Fetching address...',
//           style: const TextStyle(
//             fontSize: 18,
//             fontFamily: 'Roboto',
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms/CurrentLocationCard/location_service.dart';
import 'package:hrms/Login/login_service.dart';


class CurrentLocationCard extends StatefulWidget {
  @override
  _CurrentLocationCardState createState() => _CurrentLocationCardState();
}

class _CurrentLocationCardState extends State<CurrentLocationCard> {
  String? _currentLocation;
  String? _currentAddress;
  String? _placeName;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      Position position = await LocationService().getCurrentLocation();
      String address = await LocationService().getAddressFromLatLng(position);
      List<String> addressParts = address.split(', ');
      String placeName = addressParts[0];

      await LoginService.instance.saveLocation(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      );

      setState(() {
        _currentLocation = '${position.latitude}, ${position.longitude}';
        _currentAddress = address;
        _placeName = placeName;
      });
    } catch (e) {
      setState(() {
        _currentLocation = 'Failed to get location: $e';
        _currentAddress = '';
        _placeName = '';
      });
    }
  }

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
          _currentLocation ?? 'Fetching location...',
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _placeName ?? 'Fetching place name...',
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _currentAddress ?? 'Fetching address...',
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
