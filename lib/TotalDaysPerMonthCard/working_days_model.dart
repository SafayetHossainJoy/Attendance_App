// class WorkingDays {
//   final double days;
//   final double hours;

//   WorkingDays({
//     required this.days,
//     required this.hours,
//   });

//   factory WorkingDays.fromJson(Map<String, dynamic> json) {
//     return WorkingDays(
//       days: json['days'] != null ? json['days'].toDouble() : 0.0,
//       hours: json['hours'] != null ? json['hours'].toDouble() : 0.0,
//     );
//   }
// }

// import 'dart:convert';

// class WorkingDays {
//   final double days;
//   final double hours;

//   WorkingDays({
//     required this.days,
//     required this.hours,
//   });

//   // Updated fromJson method to handle the nested structure.
//   factory WorkingDays.fromJson(Map<String, dynamic> json) {
//     return WorkingDays(
//       days: json['days'] != null ? json['days'].toDouble() : 0.0,
//       hours: json['hours'] != null ? json['hours'].toDouble() : 0.0,
//     );
//   }

//   // Additional factory method to handle the nested response
//   factory WorkingDays.fromNestedJson(String jsonStr) {
//     // First, decode the string into a Map
//     final Map<String, dynamic> parsedJson = json.decode(jsonStr);

//     // Extract the first (and possibly only) entry in the map
//     if (parsedJson.isNotEmpty) {
//       final Map<String, dynamic> workingDaysData = parsedJson.values.first;
//       return WorkingDays.fromJson(workingDaysData);
//     } else {
//       return WorkingDays(days: 0.0, hours: 0.0);
//     }
//   }
// }

class WorkingDays {
  final double days;
  final double hours;

  WorkingDays({
    required this.days,
    required this.hours,
  });

  // A factory constructor to create an instance from a JSON map
  factory WorkingDays.fromJson(Map<String, dynamic> json) {
    return WorkingDays(
      days: json['days'] as double,
      hours: json['hours'] as double,
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'days': days,
      'hours': hours,
    };
  }
}
