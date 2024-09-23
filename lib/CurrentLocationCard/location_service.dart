// // // import 'package:geolocator/geolocator.dart';

// // // class LocationService {
// // //   Future<Position> getCurrentLocation() async {
// // //     bool serviceEnabled;
// // //     LocationPermission permission;

// // //     // Check if location services are enabled
// // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // //     if (!serviceEnabled) {
// // //       return Future.error('Location services are disabled.');
// // //     }

// // //     // Check for location permissions
// // //     permission = await Geolocator.checkPermission();
// // //     if (permission == LocationPermission.denied) {
// // //       permission = await Geolocator.requestPermission();
// // //       if (permission == LocationPermission.denied) {
// // //         return Future.error('Location permissions are denied');
// // //       }
// // //     }

// // //     if (permission == LocationPermission.deniedForever) {
// // //       return Future.error('Location permissions are permanently denied, we cannot request permissions.');
// // //     }

// // //     // Get the current location
// // //     return await Geolocator.getCurrentPosition();
// // //   }
// // // }
// // // lib/location_service.dart
// // import 'package:geolocator/geolocator.dart';

// // class LocationService {
// //   Future<Position> getCurrentLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return Future.error('Location services are disabled.');
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return Future.error('Location permissions are denied');
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       return Future.error('Location permissions are permanently denied.');
// //     }

// //     return await Geolocator.getCurrentPosition();
// //   }
// // }

// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class LocationService {
//   Future<Position> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied.');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   Future<String> getAddressFromLatLng(Position position) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       Placemark place = placemarks[0];
//       return '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
//     } catch (e) {
//       return 'Failed to get address: $e';
//     }
//   }
// }
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      return '${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    } catch (e) {
      return 'Failed to get address: $e';
    }
  }
}