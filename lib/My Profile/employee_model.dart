// // // class Employee {
// // //   final String name;
// // //   final String workPhone;
// // //   final String workEmail;
// // //   final String employeeId;
// // //   final String gender;
// // //   final String nid;
// // //   final String bloodGroup;
// // //   final String department;
// // //   final String jobPosition;
// // //   final String manager;
// // //   final String workAddress;
// // //   final String workLocation;
// // //   final DateTime joiningDate;
// // //   final DateTime? promotionDate;
// // //   final DateTime? separationDate;
// // //   final String workingHours;

// // //   Employee({
// // //     required this.name,
// // //     required this.workPhone,
// // //     required this.workEmail,
// // //     required this.employeeId,
// // //     required this.gender,
// // //     required this.nid,
// // //     required this.bloodGroup,
// // //     required this.department,
// // //     required this.jobPosition,
// // //     required this.manager,
// // //     required this.workAddress,
// // //     required this.workLocation,
// // //     required this.joiningDate,
// // //     this.promotionDate,
// // //     this.separationDate,
// // //     required this.workingHours,
// // //   });
// // // }


// // // import 'dart:convert';

// // // class Employee {
// // //   final String name;
// // //   dynamic workPhone;
// // //   final String workEmail;
// // //   final String employeeId;
// // //   dynamic gender;
// // //   dynamic nid;
// // //   dynamic bloodGroup;
// // //   final String department;
// // //   final String jobPosition;
// // //   final String manager;
// // //   final String workAddress;
// // //   final String workLocation;
// // //   final DateTime joiningDate;
// // //   final DateTime? promotionDate;
// // //   final DateTime? separationDate;
// // //   final String workingHours;
// // //   dynamic image;

// // //   Employee({
// // //     required this.name,
// // //     this.workPhone,
// // //     required this.workEmail,
// // //     required this.employeeId,
// // //     this.gender,
// // //     this.nid,
// // //     this.bloodGroup,
// // //     required this.department,
// // //     required this.jobPosition,
// // //     required this.manager,
// // //     required this.workAddress,
// // //     required this.workLocation,
// // //     required this.joiningDate,
// // //     this.promotionDate,
// // //     this.separationDate,
// // //     required this.workingHours,
// // //     this.image,
// // //   });

// // //   factory Employee.fromJson(Map<String, dynamic> json) {
// // //     return Employee(
// // //       name: json['name'],
// // //       workPhone: json['mobile'],
// // //       workEmail: json['work_email'],
// // //       employeeId: json['employee_id'],
// // //       gender: json['gender'],
// // //       nid: json['nid'],
// // //       bloodGroup: json['blood_group'],
// // //       department: json['department_id'],
// // //       jobPosition: json['job_id'],
// // //       manager: json['manager'],
// // //       workAddress: json['work_address'],
// // //       workLocation: json['work_location'],
// // //       joiningDate: DateTime.parse(json['joining_date']),
// // //       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
// // //       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
// // //       workingHours: json['work_hours'],
// // //       image: json['image_1920'],
// // //     );
// // //   }

// // //   Map<String, dynamic> toJson() {
// // //     return {
// // //       'name': name,
// // //       'mobile': workPhone,
// // //       'work_email': workEmail,
// // //       'employee_id': employeeId,
// // //       'gender': gender,
// // //       'nid': nid,
// // //       'blood_group': bloodGroup,
// // //       'department_id': department,
// // //       'job_id': jobPosition,
// // //       'manager': manager,
// // //       'work_address': workAddress,
// // //       'work_location': workLocation,
// // //       'joining_date': joiningDate.toIso8601String(),
// // //       'promotion_date': promotionDate?.toIso8601String() ?? false,
// // //       'separation_date': separationDate?.toIso8601String() ?? false,
// // //       'work_hours': workingHours,
// // //       'image_1920': image,
// // //     };
// // //   }

// // //   static List<Employee> fromJsonList(String jsonString) {
// // //     final List<dynamic> jsonList = jsonDecode(jsonString);
// // //     return jsonList.map((json) => Employee.fromJson(json)).toList();
// // //   }
// // // }


// // import 'dart:convert';

// // class Employee {
// //   final String name;
// //   dynamic workPhone;
// //   final String workEmail;
// //   final String employeeId;
// //   dynamic gender;
// //   dynamic nid;
// //   dynamic bloodGroup;
// //   final String department;
// //   final String jobPosition;
// //   final String manager;
// //   final String workAddress;
// //   final String workLocation;
// //   final DateTime joiningDate;
// //   final DateTime? promotionDate;
// //   final DateTime? separationDate;
// //   final String workingHours;
// //   dynamic image;

// //   Employee({
// //     required this.name,
// //     this.workPhone,
// //     required this.workEmail,
// //     required this.employeeId,
// //     this.gender,
// //     this.nid,
// //     this.bloodGroup,
// //     required this.department,
// //     required this.jobPosition,
// //     required this.manager,
// //     required this.workAddress,
// //     required this.workLocation,
// //     required this.joiningDate,
// //     this.promotionDate,
// //     this.separationDate,
// //     required this.workingHours,
// //     this.image,
// //   });

// //   factory Employee.fromJson(Map<String, dynamic> json) {
// //     return Employee(
// //       name: json['name'],
// //       workPhone: json['mobile'],
// //       workEmail: json['work_email'],
// //       employeeId: json['employee_id'],
// //       gender: json['gender'],
// //       nid: json['nid'],
// //       bloodGroup: json['blood_group'],
// //       department: json['department_id'],
// //       jobPosition: json['job_id'],
// //       manager: json['manager'],
// //       workAddress: json['work_address'],
// //       workLocation: json['work_location'] ?? 'N/A',  // Handle null cases
// //       joiningDate: DateTime.parse(json['joining_date']),
// //       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
// //       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
// //       workingHours: json['work_hours'],
// //       image: json['image_1920'],
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'name': name,
// //       'mobile': workPhone,
// //       'work_email': workEmail,
// //       'employee_id': employeeId,
// //       'gender': gender,
// //       'nid': nid,
// //       'blood_group': bloodGroup,
// //       'department_id': department,
// //       'job_id': jobPosition,
// //       'manager': manager,
// //       'work_address': workAddress,
// //       'work_location': workLocation,
// //       'joining_date': joiningDate.toIso8601String(),
// //       'promotion_date': promotionDate?.toIso8601String() ?? false,
// //       'separation_date': separationDate?.toIso8601String() ?? false,
// //       'work_hours': workingHours,
// //       'image_1920': image,
// //     };
// //   }

// //   static List<Employee> fromJsonList(String jsonString) {
// //     final List<dynamic> jsonList = jsonDecode(jsonString);
// //     return jsonList.map((json) => Employee.fromJson(json)).toList();
// //   }
// // }

// import 'dart:convert';

// /// Enum for gender selection
// enum Gender { male, female, other }

// /// Enum for blood group selection
// enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// /// Employee model class
// class Employee {
//   final String name;
//   dynamic workPhone;
//   final String workEmail;
//   final String employeeId;
//   final Gender gender;  // Enum for gender
//   final BloodGroup bloodGroup;  // Enum for blood group
//   dynamic nid;
//   final String department;
//   final String jobPosition;
//   final String manager;
//   final String workAddress;
//   final String workLocation;
//   final DateTime joiningDate;
//   final DateTime? promotionDate;
//   final DateTime? separationDate;
//   final String workingHours;
//   dynamic image;

//   Employee({
//     required this.name,
//     this.workPhone,
//     required this.workEmail,
//     required this.employeeId,
//     required this.gender,  // Store as enum
//     required this.bloodGroup,  // Store as enum
//     this.nid,
//     required this.department,
//     required this.jobPosition,
//     required this.manager,
//     required this.workAddress,
//     required this.workLocation,
//     required this.joiningDate,
//     this.promotionDate,
//     this.separationDate,
//     required this.workingHours,
//     this.image,
//   });

//   /// Factory constructor to create Employee from JSON
//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       name: json['name'],
//       workPhone: json['mobile'],
//       workEmail: json['work_email'],
//       employeeId: json['employee_id'],
//       gender: _parseGender(json['gender']),  // Parse gender string to enum
//       bloodGroup: _parseBloodGroup(json['blood_group']),  // Parse blood group string to enum
//       nid: json['nid'],
//       department: json['department_id'],
//       jobPosition: json['job_id'],
//       manager: json['manager'],
//       workAddress: json['work_address'],
//       workLocation: json['work_location'] ?? 'N/A',
//       joiningDate: DateTime.parse(json['joining_date']),
//       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
//       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
//       workingHours: json['work_hours'],
//       image: json['image_1920'],
//     );
//   }

//   /// Convert Employee instance back to JSON format
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'mobile': workPhone,
//       'work_email': workEmail,
//       'employee_id': employeeId,
//       'gender': _genderToString(gender),  // Convert enum back to string
//       'blood_group': _bloodGroupToString(bloodGroup),  // Convert enum back to string
//       'nid': nid,
//       'department_id': department,
//       'job_id': jobPosition,
//       'manager': manager,
//       'work_address': workAddress,
//       'work_location': workLocation,
//       'joining_date': joiningDate.toIso8601String(),
//       'promotion_date': promotionDate?.toIso8601String() ?? false,
//       'separation_date': separationDate?.toIso8601String() ?? false,
//       'work_hours': workingHours,
//       'image_1920': image,
//     };
//   }

//   /// Helper function to convert a string into a Gender enum
//   static Gender _parseGender(String genderString) {
//     switch (genderString.toLowerCase()) {
//       case 'male':
//         return Gender.male;
//       case 'female':
//         return Gender.female;
//       default:
//         return Gender.other;
//     }
//   }

//   /// Helper function to convert a string into a BloodGroup enum
//   static BloodGroup _parseBloodGroup(String bloodGroupString) {
//     switch (bloodGroupString.toLowerCase()) {
//       case 'a+':
//         return BloodGroup.APlus;
//       case 'a-':
//         return BloodGroup.AMinus;
//       case 'b+':
//         return BloodGroup.BPlus;
//       case 'b-':
//         return BloodGroup.BMinus;
//       case 'o+':
//         return BloodGroup.OPlus;
//       case 'o-':
//         return BloodGroup.OMinus;
//       case 'ab+':
//         return BloodGroup.ABPlus;
//       case 'ab-':
//         return BloodGroup.ABMinus;
//       default:
//         throw Exception('Invalid blood group');
//     }
//   }

//   /// Helper function to convert a Gender enum into a string
//   static String _genderToString(Gender gender) {
//     switch (gender) {
//       case Gender.male:
//         return 'Male';
//       case Gender.female:
//         return 'Female';
//       case Gender.other:
//         return 'Other';
//     }
//   }

//   /// Helper function to convert a BloodGroup enum into a string
//   static String _bloodGroupToString(BloodGroup bloodGroup) {
//     switch (bloodGroup) {
//       case BloodGroup.APlus:
//         return 'A+';
//       case BloodGroup.AMinus:
//         return 'A-';
//       case BloodGroup.BPlus:
//         return 'B+';
//       case BloodGroup.BMinus:
//         return 'B-';
//       case BloodGroup.OPlus:
//         return 'O+';
//       case BloodGroup.OMinus:
//         return 'O-';
//       case BloodGroup.ABPlus:
//         return 'AB+';
//       case BloodGroup.ABMinus:
//         return 'AB-';
//     }
//   }

//   /// Helper function to parse a JSON list into a list of Employee objects
//   static List<Employee> fromJsonList(String jsonString) {
//     final List<dynamic> jsonList = jsonDecode(jsonString);
//     return jsonList.map((json) => Employee.fromJson(json)).toList();
//   }
// }


import 'dart:convert';

/// Enum for gender selection
enum Gender { Male, Female, Other }

/// Enum for blood group selection
enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

/// Employee model class
class Employee {
  final String name;
  dynamic workPhone;
  final String workEmail;
  final String employeeId;
  final Gender gender;  // Enum for gender
  final BloodGroup bloodGroup;  // Enum for blood group
  dynamic nid;
  final String department;
  final String jobPosition;
  final String manager;
  final String workAddress;
  final String workLocation;
  final DateTime joiningDate;
  final DateTime? promotionDate;
  final DateTime? separationDate;
  final String workingHours;
  dynamic image;

  Employee({
    required this.name,
    this.workPhone,
    required this.workEmail,
    required this.employeeId,
    required this.gender,  // Store as enum
    required this.bloodGroup,  // Store as enum
    this.nid,
    required this.department,
    required this.jobPosition,
    required this.manager,
    required this.workAddress,
    required this.workLocation,
    required this.joiningDate,
    this.promotionDate,
    this.separationDate,
    required this.workingHours,
    this.image,
  });

  /// Factory constructor to create Employee from JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      workPhone: json['mobile'],
      workEmail: json['work_email'],
      employeeId: json['employee_id'],
      gender: _parseGender(json['gender']),  // Parse gender string to enum
      bloodGroup: _parseBloodGroup(json['blood_group']),  // Parse blood group string to enum
      nid: json['nid'],
      department: json['department_id'],
      jobPosition: json['job_id'],
      manager: json['manager'],
      workAddress: json['work_address'],
      workLocation: json['work_location'] ?? 'N/A',
      joiningDate: DateTime.parse(json['joining_date']),
      promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
      separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
      workingHours: json['work_hours'],
      image: json['image_1920'],
    );
  }

  /// Convert Employee instance back to JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': workPhone,
      'work_email': workEmail,
      'employee_id': employeeId,
      'gender': _genderToString(gender),  // Convert enum back to string
      'blood_group': _bloodGroupToString(bloodGroup),  // Convert enum back to string
      'nid': nid,
      'department_id': department,
      'job_id': jobPosition,
      'manager': manager,
      'work_address': workAddress,
      'work_location': workLocation,
      'joining_date': joiningDate.toIso8601String(),
      'promotion_date': promotionDate?.toIso8601String() ?? false,
      'separation_date': separationDate?.toIso8601String() ?? false,
      'work_hours': workingHours,
      'image_1920': image,
    };
  }

  /// Helper function to convert a string into a Gender enum
  static Gender _parseGender(String genderString) {
    switch (genderString.toLowerCase()) {
      case 'male':
        return Gender.Male;
      case 'female':
        return Gender.Female;
      default:
        return Gender.Other;
    }
  }

  /// Helper function to convert a string into a BloodGroup enum
  static BloodGroup _parseBloodGroup(String bloodGroupString) {
    switch (bloodGroupString.toLowerCase()) {
      case 'a+':
        return BloodGroup.APlus;
      case 'a-':
        return BloodGroup.AMinus;
      case 'b+':
        return BloodGroup.BPlus;
      case 'b-':
        return BloodGroup.BMinus;
      case 'o+':
        return BloodGroup.OPlus;
      case 'o-':
        return BloodGroup.OMinus;
      case 'ab+':
        return BloodGroup.ABPlus;
      case 'ab-':
        return BloodGroup.ABMinus;
      default:
        throw Exception('Invalid blood group');
    }
  }

  /// Helper function to convert a Gender enum into a string
  static String _genderToString(Gender gender) {
    switch (gender) {
      case Gender.Male:
        return 'Male';
      case Gender.Female:
        return 'Female';
      case Gender.Other:
        return 'Other';
    }
  }

  /// Helper function to convert a BloodGroup enum into a string
  static String _bloodGroupToString(BloodGroup bloodGroup) {
    switch (bloodGroup) {
      case BloodGroup.APlus:
        return 'A+';
      case BloodGroup.AMinus:
        return 'A-';
      case BloodGroup.BPlus:
        return 'B+';
      case BloodGroup.BMinus:
        return 'B-';
      case BloodGroup.OPlus:
        return 'O+';
      case BloodGroup.OMinus:
        return 'O-';
      case BloodGroup.ABPlus:
        return 'AB+';
      case BloodGroup.ABMinus:
        return 'AB-';
    }
  }

  /// Helper function to parse a JSON list into a list of Employee objects
  static List<Employee> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Employee.fromJson(json)).toList();
  }
}
