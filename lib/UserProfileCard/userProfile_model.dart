// // // // // // // // class UserProfile {
// // // // // // // //   final int id;
// // // // // // // //   final String name;
// // // // // // // //   final String workEmail;
// // // // // // // //   final String workPhone;
// // // // // // // //   final bool mobile;
// // // // // // // //   final String image;
// // // // // // // //   final String department;
// // // // // // // //   final String jobId;

// // // // // // // //   UserProfile({
// // // // // // // //     required this.id,
// // // // // // // //     required this.name,
// // // // // // // //     required this.workEmail,
// // // // // // // //     required this.workPhone,
// // // // // // // //     required this.mobile,
// // // // // // // //     required this.image,
// // // // // // // //     required this.department,
// // // // // // // //     required this.jobId,
// // // // // // // //   });

// // // // // // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // // // // // //     return UserProfile(
// // // // // // // //       id: json['id'],
// // // // // // // //       name: json['name'],
// // // // // // // //       workEmail: json['work_email'],
// // // // // // // //       workPhone: json['work_phone'],
// // // // // // // //       mobile: json['mobile'],
// // // // // // // //       image: json['image_1920'],
// // // // // // // //       department: json['department_id'],
// // // // // // // //       jobId: json['job_id'],
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // // class UserProfile {
// // // // // // //   final int id;
// // // // // // //   final String name;
// // // // // // //   final String workEmail;
// // // // // // //   final String mobile;
// // // // // // //   final String image;
// // // // // // //   final String department;
// // // // // // //   final String jobId;
// // // // // // //   final String? joiningDate;
// // // // // // //   final bool? separationDate;
// // // // // // //   final String? workLocation;
// // // // // // //   final String? gender;
// // // // // // //   final String? bloodGroup;
// // // // // // //   final String? employeeId;
// // // // // // //   final String? manager;
// // // // // // //   final String? workAddress;
// // // // // // //   final String? promotionDate;
// // // // // // //   final String? workHours;

// // // // // // //   UserProfile({
// // // // // // //     required this.id,
// // // // // // //     required this.name,
// // // // // // //     required this.workEmail,
// // // // // // //     required this.mobile,
// // // // // // //     required this.image,
// // // // // // //     required this.department,
// // // // // // //     required this.jobId,
// // // // // // //     this.joiningDate,
// // // // // // //     this.separationDate,
// // // // // // //     this.workLocation,
// // // // // // //     this.gender,
// // // // // // //     this.bloodGroup,
// // // // // // //     this.employeeId,
// // // // // // //     this.manager,
// // // // // // //     this.workAddress,
// // // // // // //     this.promotionDate,
// // // // // // //     this.workHours,
// // // // // // //   });

// // // // // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // // // // //     return UserProfile(
// // // // // // //       id: json['id'],
// // // // // // //       name: json['name'],
// // // // // // //       workEmail: json['work_email'],
// // // // // // //       mobile: json['mobile'],
// // // // // // //       image: json['image_1920'],
// // // // // // //       department: json['department_id'],
// // // // // // //       jobId: json['job_id'],
// // // // // // //       joiningDate: json['joining_date'],
// // // // // // //       separationDate: json['separation_date'] == false ? null : json['separation_date'],
// // // // // // //       workLocation: json['work_location'] == false ? null : json['work_location'],
// // // // // // //       gender: json['gender'],
// // // // // // //       bloodGroup: json['blood_group'],
// // // // // // //       employeeId: json['employee_id'],
// // // // // // //       manager: json['manager'],
// // // // // // //       workAddress: json['work_address'],
// // // // // // //       promotionDate: json['promotion_date'] == false ? null : json['promotion_date'],
// // // // // // //       workHours: json['work_hours'],
// // // // // // //     );
// // // // // // //   }
// // // // // // // }




// // // // // class UserProfile {
// // // // //   final int id;
// // // // //   final String name;
// // // // //   dynamic workEmail;
// // // // //   dynamic mobile;
// // // // //   final String image;
// // // // //   dynamic department;
// // // // //   dynamic jobPosition;
// // // // //   dynamic workLocation; // Nullable field as it can be false in the response
// // // // //   dynamic separationDate; // Nullable field
// // // // //   dynamic promotionDate; // Nullable field

// // // // //   UserProfile({
// // // // //     required this.id,
// // // // //     required this.name,
// // // // //     required this.workEmail,
// // // // //     required this.mobile,
// // // // //     required this.image,
// // // // //     required this.department,
// // // // //     required this.jobPosition,
// // // // //     this.workLocation,
// // // // //     this.separationDate,
// // // // //     this.promotionDate,
// // // // //   });

// // // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // // //     return UserProfile(
// // // // //       id: json['id'] ?? 0,
// // // // //       name: json['name'] ?? '',
// // // // //       workEmail: json['work_email'] ?? '',
// // // // //       mobile: json['mobile'] ?? '',
// // // // //       image: json['image_1920'] ?? '',
// // // // //       department: json['department_id'] ?? '',
// // // // //       jobPosition: json['job_id']?? '',
// // // // //       workLocation: json['work_location'] is String ? json['work_location'] : null,
// // // // //       separationDate: json['separation_date'] is String ? json['separation_date'] : null,
// // // // //       promotionDate: json['promotion_date'] is String ? json['promotion_date'] : null,
// // // // //     );
// // // // //   }
// // // // // }


// // // // // // import 'dart:convert';

// // // // // // /// Enum for gender selection
// // // // // // enum Gender { Male, Female, Other }

// // // // // // /// Enum for blood group selection
// // // // // // enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// // // // // // /// Employee model class
// // // // // // class UserProfile {
// // // // // //   final String name;
// // // // // //   dynamic workPhone;
// // // // // //   final String workEmail;
// // // // // //   final String employeeId;
// // // // // //   final Gender gender;  // Enum for gender
// // // // // //   final BloodGroup bloodGroup;  // Enum for blood group
// // // // // //   dynamic nid;
// // // // // //   final String department;
// // // // // //   final String jobPosition;
// // // // // //   final String manager;
// // // // // //   final String workAddress;
// // // // // //   final String workLocation;
// // // // // //   final DateTime joiningDate;
// // // // // //   final DateTime? promotionDate;
// // // // // //   final DateTime? separationDate;
// // // // // //   final String workingHours;
// // // // // //   dynamic image;

// // // // // //   UserProfile({
// // // // // //     required this.name,
// // // // // //     this.workPhone,
// // // // // //     required this.workEmail,
// // // // // //     required this.employeeId,
// // // // // //     required this.gender,  // Store as enum
// // // // // //     required this.bloodGroup,  // Store as enum
// // // // // //     this.nid,
// // // // // //     required this.department,
// // // // // //     required this.jobPosition,
// // // // // //     required this.manager,
// // // // // //     required this.workAddress,
// // // // // //     required this.workLocation,
// // // // // //     required this.joiningDate,
// // // // // //     this.promotionDate,
// // // // // //     this.separationDate,
// // // // // //     required this.workingHours,
// // // // // //     this.image,
// // // // // //   });

// // // // // //   /// Factory constructor to create Employee from JSON
// // // // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // // // //     return UserProfile(
// // // // // //       name: json['name'],
// // // // // //       workPhone: json['mobile'],
// // // // // //       workEmail: json['work_email'],
// // // // // //       employeeId: json['employee_id'],
// // // // // //       gender: _parseGender(json['gender']),  // Parse gender string to enum
// // // // // //       bloodGroup: _parseBloodGroup(json['blood_group']),  // Parse blood group string to enum
// // // // // //       nid: json['nid'],
// // // // // //       department: json['department_id'],
// // // // // //       jobPosition: json['job_id'],
// // // // // //       manager: json['manager'],
// // // // // //       workAddress: json['work_address'],
// // // // // //       workLocation: json['work_location'] ?? 'N/A',
// // // // // //       joiningDate: DateTime.parse(json['joining_date']),
// // // // // //       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
// // // // // //       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
// // // // // //       workingHours: json['work_hours'],
// // // // // //       image: json['image_1920'],
// // // // // //     );
// // // // // //   }

// // // // // //   /// Convert Employee instance back to JSON format
// // // // // //   Map<String, dynamic> toJson() {
// // // // // //     return {
// // // // // //       'name': name,
// // // // // //       'mobile': workPhone,
// // // // // //       'work_email': workEmail,
// // // // // //       'employee_id': employeeId,
// // // // // //       'gender': _genderToString(gender),  // Convert enum back to string
// // // // // //       'blood_group': _bloodGroupToString(bloodGroup),  // Convert enum back to string
// // // // // //       'nid': nid,
// // // // // //       'department_id': department,
// // // // // //       'job_id': jobPosition,
// // // // // //       'manager': manager,
// // // // // //       'work_address': workAddress,
// // // // // //       'work_location': workLocation,
// // // // // //       'joining_date': joiningDate.toIso8601String(),
// // // // // //       'promotion_date': promotionDate?.toIso8601String() ?? false,
// // // // // //       'separation_date': separationDate?.toIso8601String() ?? false,
// // // // // //       'work_hours': workingHours,
// // // // // //       'image_1920': image,
// // // // // //     };
// // // // // //   }

// // // // // //   /// Helper function to convert a string into a Gender enum
// // // // // //   static Gender _parseGender(String genderString) {
// // // // // //     switch (genderString.toLowerCase()) {
// // // // // //       case 'male':
// // // // // //         return Gender.Male;
// // // // // //       case 'female':
// // // // // //         return Gender.Female;
// // // // // //       default:
// // // // // //         return Gender.Other;
// // // // // //     }
// // // // // //   }

// // // // // //   /// Helper function to convert a string into a BloodGroup enum
// // // // // //   static BloodGroup _parseBloodGroup(String bloodGroupString) {
// // // // // //     switch (bloodGroupString.toLowerCase()) {
// // // // // //       case 'a+':
// // // // // //         return BloodGroup.APlus;
// // // // // //       case 'a-':
// // // // // //         return BloodGroup.AMinus;
// // // // // //       case 'b+':
// // // // // //         return BloodGroup.BPlus;
// // // // // //       case 'b-':
// // // // // //         return BloodGroup.BMinus;
// // // // // //       case 'o+':
// // // // // //         return BloodGroup.OPlus;
// // // // // //       case 'o-':
// // // // // //         return BloodGroup.OMinus;
// // // // // //       case 'ab+':
// // // // // //         return BloodGroup.ABPlus;
// // // // // //       case 'ab-':
// // // // // //         return BloodGroup.ABMinus;
// // // // // //       default:
// // // // // //         throw Exception('Invalid blood group');
// // // // // //     }
// // // // // //   }

// // // // // //   /// Helper function to convert a Gender enum into a string
// // // // // //   static String _genderToString(Gender gender) {
// // // // // //     switch (gender) {
// // // // // //       case Gender.Male:
// // // // // //         return 'Male';
// // // // // //       case Gender.Female:
// // // // // //         return 'Female';
// // // // // //       case Gender.Other:
// // // // // //         return 'Other';
// // // // // //     }
// // // // // //   }

// // // // // //   /// Helper function to convert a BloodGroup enum into a string
// // // // // //   static String _bloodGroupToString(BloodGroup bloodGroup) {
// // // // // //     switch (bloodGroup) {
// // // // // //       case BloodGroup.APlus:
// // // // // //         return 'A+';
// // // // // //       case BloodGroup.AMinus:
// // // // // //         return 'A-';
// // // // // //       case BloodGroup.BPlus:
// // // // // //         return 'B+';
// // // // // //       case BloodGroup.BMinus:
// // // // // //         return 'B-';
// // // // // //       case BloodGroup.OPlus:
// // // // // //         return 'O+';
// // // // // //       case BloodGroup.OMinus:
// // // // // //         return 'O-';
// // // // // //       case BloodGroup.ABPlus:
// // // // // //         return 'AB+';
// // // // // //       case BloodGroup.ABMinus:
// // // // // //         return 'AB-';
// // // // // //     }
// // // // // //   }

// // // // // //   /// Helper function to parse a JSON list into a list of Employee objects
// // // // // //   static List<UserProfile> fromJsonList(String jsonString) {
// // // // // //     final List<dynamic> jsonList = jsonDecode(jsonString);
// // // // // //     return jsonList.map((json) => UserProfile.fromJson(json)).toList();
// // // // // //   }
// // // // // // }

// // // // import 'dart:convert';

// // // // /// Enum for gender selection
// // // // enum Gender { Male, Female, Other }

// // // // /// Enum for blood group selection
// // // // enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// // // // /// UserProfile model class
// // // // class UserProfile {
// // // //   final String name;
// // // //   dynamic workPhone;
// // // //   final String workEmail;
// // // //   final String employeeId;
// // // //   final Gender gender;  // Enum for gender
// // // //   final BloodGroup bloodGroup;  // Enum for blood group
// // // //   dynamic nid;
// // // //   final String department;
// // // //   final String jobPosition;
// // // //   final String manager;
// // // //   final String workAddress;
// // // //   final String workLocation;
// // // //   final DateTime joiningDate;
// // // //   final DateTime? promotionDate;
// // // //   final DateTime? separationDate;
// // // //   final String workingHours;
// // // //   dynamic image;

// // // //   UserProfile({
// // // //     required this.name,
// // // //     this.workPhone,
// // // //     required this.workEmail,
// // // //     required this.employeeId,
// // // //     required this.gender,  // Store as enum
// // // //     required this.bloodGroup,  // Store as enum
// // // //     this.nid,
// // // //     required this.department,
// // // //     required this.jobPosition,
// // // //     required this.manager,
// // // //     required this.workAddress,
// // // //     required this.workLocation,
// // // //     required this.joiningDate,
// // // //     this.promotionDate,
// // // //     this.separationDate,
// // // //     required this.workingHours,
// // // //     this.image,
// // // //   });

// // // //   /// Factory constructor to create UserProfile from JSON
// // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // //     return UserProfile(
// // // //       name: json['name'],
// // // //       workPhone: json['mobile'],
// // // //       workEmail: json['work_email'],
// // // //       employeeId: json['employee_id'],
// // // //       gender: _parseGender(json['gender']),  // Parse gender string to enum
// // // //       bloodGroup: _parseBloodGroup(json['blood_group']),  // Parse blood group string to enum
// // // //       nid: json['nid'],
// // // //       department: json['department_id'],
// // // //       jobPosition: json['job_id'],
// // // //       manager: json['manager'],
// // // //       workAddress: json['work_address'],
// // // //       workLocation: json['work_location'] ?? 'N/A',
// // // //       joiningDate: DateTime.parse(json['joining_date']),
// // // //       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
// // // //       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
// // // //       workingHours: json['work_hours'],
// // // //       image: json['image_1920'],
// // // //     );
// // // //   }

// // // //   /// Convert UserProfile instance back to JSON format
// // // //   Map<String, dynamic> toJson() {
// // // //     return {
// // // //       'name': name,
// // // //       'mobile': workPhone,
// // // //       'work_email': workEmail,
// // // //       'employee_id': employeeId,
// // // //       'gender': _genderToString(gender),  // Convert enum back to string
// // // //       'blood_group': _bloodGroupToString(bloodGroup),  // Convert enum back to string
// // // //       'nid': nid,
// // // //       'department_id': department,
// // // //       'job_id': jobPosition,
// // // //       'manager': manager,
// // // //       'work_address': workAddress,
// // // //       'work_location': workLocation,
// // // //       'joining_date': joiningDate.toIso8601String(),
// // // //       'promotion_date': promotionDate?.toIso8601String() ?? false,
// // // //       'separation_date': separationDate?.toIso8601String() ?? false,
// // // //       'work_hours': workingHours,
// // // //       'image_1920': image,
// // // //     };
// // // //   }

// // // //   /// Helper function to convert a string into a Gender enum
// // // //   static Gender _parseGender(String genderString) {
// // // //     switch (genderString.toLowerCase()) {
// // // //       case 'male':
// // // //         return Gender.Male;
// // // //       case 'female':
// // // //         return Gender.Female;
// // // //       default:
// // // //         return Gender.Other;
// // // //     }
// // // //   }

// // // //   /// Helper function to convert a string into a BloodGroup enum
// // // //   static BloodGroup _parseBloodGroup(String bloodGroupString) {
// // // //     switch (bloodGroupString.toLowerCase()) {
// // // //       case 'a+':
// // // //         return BloodGroup.APlus;
// // // //       case 'a-':
// // // //         return BloodGroup.AMinus;
// // // //       case 'b+':
// // // //         return BloodGroup.BPlus;
// // // //       case 'b-':
// // // //         return BloodGroup.BMinus;
// // // //       case 'o+':
// // // //         return BloodGroup.OPlus;
// // // //       case 'o-':
// // // //         return BloodGroup.OMinus;
// // // //       case 'ab+':
// // // //         return BloodGroup.ABPlus;
// // // //       case 'ab-':
// // // //         return BloodGroup.ABMinus;
// // // //       default:
// // // //         throw Exception('Invalid blood group');
// // // //     }
// // // //   }

// // // //   /// Helper function to convert a Gender enum into a string
// // // //   static String _genderToString(Gender gender) {
// // // //     switch (gender) {
// // // //       case Gender.Male:
// // // //         return 'Male';
// // // //       case Gender.Female:
// // // //         return 'Female';
// // // //       case Gender.Other:
// // // //         return 'Other';
// // // //     }
// // // //   }

// // // //   /// Helper function to convert a BloodGroup enum into a string
// // // //   static String _bloodGroupToString(BloodGroup bloodGroup) {
// // // //     switch (bloodGroup) {
// // // //       case BloodGroup.APlus:
// // // //         return 'A+';
// // // //       case BloodGroup.AMinus:
// // // //         return 'A-';
// // // //       case BloodGroup.BPlus:
// // // //         return 'B+';
// // // //       case BloodGroup.BMinus:
// // // //         return 'B-';
// // // //       case BloodGroup.OPlus:
// // // //         return 'O+';
// // // //       case BloodGroup.OMinus:
// // // //         return 'O-';
// // // //       case BloodGroup.ABPlus:
// // // //         return 'AB+';
// // // //       case BloodGroup.ABMinus:
// // // //         return 'AB-';
// // // //     }
// // // //   }

// // // //   /// Helper function to parse a JSON list into a list of UserProfile objects
// // // //   static List<UserProfile> fromJsonList(String jsonString) {
// // // //     final List<dynamic> jsonList = jsonDecode(jsonString);
// // // //     return jsonList.map((json) => UserProfile.fromJson(json)).toList();
// // // //   }
// // // // }





// // // // enum Gender { Male, Female, Other }
// // // // enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// // // // class UserProfile {
// // // //   final String name;
// // // //   dynamic workPhone;
// // // //   final String workEmail;
// // // //   final String employeeId;
// // // //   final Gender gender;
// // // //   final BloodGroup bloodGroup;
// // // //   dynamic nid;
// // // //   final String department;
// // // //   final String jobPosition;
// // // //   final String manager;
// // // //   final String workAddress;
// // // //   final String workLocation;
// // // //   final DateTime joiningDate;
// // // //   final DateTime? promotionDate;
// // // //   final DateTime? separationDate;
// // // //   final String workingHours;
// // // //   dynamic image;

// // // //   UserProfile({
// // // //     required this.name,
// // // //     this.workPhone,
// // // //     required this.workEmail,
// // // //     required this.employeeId,
// // // //     required this.gender,
// // // //     required this.bloodGroup,
// // // //     this.nid,
// // // //     required this.department,
// // // //     required this.jobPosition,
// // // //     required this.manager,
// // // //     required this.workAddress,
// // // //     required this.workLocation,
// // // //     required this.joiningDate,
// // // //     this.promotionDate,
// // // //     this.separationDate,
// // // //     required this.workingHours,
// // // //     this.image,
// // // //   });

// // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // //     return UserProfile(
// // // //       name: json['name'],
// // // //       workPhone: json['mobile'],
// // // //       workEmail: json['work_email'],
// // // //       employeeId: json['employee_id'],
// // // //       gender: _parseGender(json['gender']),
// // // //       bloodGroup: _parseBloodGroup(json['blood_group']),
// // // //       nid: json['nid'],
// // // //       department: json['department_id'],
// // // //       jobPosition: json['job_id'],
// // // //       manager: json['manager'],
// // // //       workAddress: json['work_address'],
// // // //       workLocation: json['work_location'] ?? 'N/A',
// // // //       joiningDate: DateTime.parse(json['joining_date']),
// // // //       promotionDate: json['promotion_date'] != false
// // // //           ? DateTime.parse(json['promotion_date'])
// // // //           : null,
// // // //       separationDate: json['separation_date'] != false
// // // //           ? DateTime.parse(json['separation_date'])
// // // //           : null,
// // // //       workingHours: json['work_hours'],
// // // //       image: json['image_1920'],
// // // //     );
// // // //   }

// // // //   static Gender _parseGender(String genderString) {
// // // //     switch (genderString.toLowerCase()) {
// // // //       case 'male':
// // // //         return Gender.Male;
// // // //       case 'female':
// // // //         return Gender.Female;
// // // //       default:
// // // //         return Gender.Other;
// // // //     }
// // // //   }

// // // //   static BloodGroup _parseBloodGroup(String bloodGroupString) {
// // // //     switch (bloodGroupString.toLowerCase()) {
// // // //       case 'a+':
// // // //         return BloodGroup.APlus;
// // // //       case 'a-':
// // // //         return BloodGroup.AMinus;
// // // //       case 'b+':
// // // //         return BloodGroup.BPlus;
// // // //       case 'b-':
// // // //         return BloodGroup.BMinus;
// // // //       case 'o+':
// // // //         return BloodGroup.OPlus;
// // // //       case 'o-':
// // // //         return BloodGroup.OMinus;
// // // //       case 'ab+':
// // // //         return BloodGroup.ABPlus;
// // // //       case 'ab-':
// // // //         return BloodGroup.ABMinus;
// // // //       default:
// // // //         throw Exception('Invalid blood group');
// // // //     }
// // // //   }
// // // // }

// // // import 'dart:convert';

// // // enum Gender { Male, Female, Other }
// // // enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// // // class UserProfile {
// // //   final String name;
// // //   dynamic workPhone;
// // //   final String workEmail;
// // //   final String employeeId;
// // //   final Gender gender;
// // //   final BloodGroup bloodGroup;
// // //   dynamic nid;
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

// // //   UserProfile({
// // //     required this.name,
// // //     this.workPhone,
// // //     required this.workEmail,
// // //     required this.employeeId,
// // //     required this.gender,
// // //     required this.bloodGroup,
// // //     this.nid,
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

// // //   // Updated fromJson method with null safety
// // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // //     return UserProfile(
// // //       name: json['name'] ?? 'Unknown',  // Provide default value if null
// // //       workPhone: json['mobile'],
// // //       workEmail: json['work_email'] ?? 'no-email@domain.com',  // Default value if null
// // //       employeeId: json['employee_id'] ?? 'Unknown',  // Default value if null
// // //       gender: _parseGender(json['gender'] ?? 'other'),  // Handle null with fallback
// // //       bloodGroup: _parseBloodGroup(json['blood_group'] ?? 'unknown'),  // Handle null
// // //       nid: json['nid'],  // This can stay nullable
// // //       department: json['department_id'] ?? 'Unknown Department',  // Default value if null
// // //       jobPosition: json['job_id'] ?? 'Unknown Position',  // Default value if null
// // //       manager: json['manager'] ?? 'No Manager',  // Default value if null
// // //       workAddress: json['work_address'] ?? 'No Address',  // Default value if null
// // //       workLocation: json['work_location'] ?? 'Unknown Location',  // Default value if null
// // //       joiningDate: DateTime.tryParse(json['joining_date']) ?? DateTime.now(),  // Fallback to current date if null
// // //       promotionDate: json['promotion_date'] != false
// // //           ? DateTime.tryParse(json['promotion_date'])
// // //           : null,
// // //       separationDate: json['separation_date'] != false
// // //           ? DateTime.tryParse(json['separation_date'])
// // //           : null,
// // //       workingHours: json['work_hours'] ?? 'N/A',  // Default value if null
// // //       image: json['image_1920'],  // This can stay nullable
// // //     );
// // //   }

// // //   // Parsing gender safely
// // //   static Gender _parseGender(String genderString) {
// // //     switch (genderString.toLowerCase()) {
// // //       case 'male':
// // //         return Gender.Male;
// // //       case 'female':
// // //         return Gender.Female;
// // //       default:
// // //         return Gender.Other;  // Fallback for invalid values
// // //     }
// // //   }

// // //   // Parsing blood group safely
// // //   static BloodGroup _parseBloodGroup(String bloodGroupString) {
// // //     switch (bloodGroupString.toLowerCase()) {
// // //       case 'a+':
// // //         return BloodGroup.APlus;
// // //       case 'a-':
// // //         return BloodGroup.AMinus;
// // //       case 'b+':
// // //         return BloodGroup.BPlus;
// // //       case 'b-':
// // //         return BloodGroup.BMinus;
// // //       case 'o+':
// // //         return BloodGroup.OPlus;
// // //       case 'o-':
// // //         return BloodGroup.OMinus;
// // //       case 'ab+':
// // //         return BloodGroup.ABPlus;
// // //       case 'ab-':
// // //         return BloodGroup.ABMinus;
// // //       default:
// // //         throw Exception('Invalid blood group');  // Throw exception for unknown blood groups
// // //     }
// // //   }
// // // }

// // // // class UserProfile {
// // // //   final String name;
// // // //   dynamic workPhone;
// // // //   final String workEmail;
// // // //   final String employeeId;
// // // //   final Gender gender;
// // // //   final BloodGroup? bloodGroup;  // Make this nullable if needed
// // // //   dynamic nid;
// // // //   final String department;
// // // //   final String jobPosition;
// // // //   final String manager;
// // // //   final String workAddress;
// // // //   final String workLocation;
// // // //   final DateTime joiningDate;
// // // //   final DateTime? promotionDate;
// // // //   final DateTime? separationDate;
// // // //   final String workingHours;
// // // //   dynamic image;

// // // //   UserProfile({
// // // //     required this.name,
// // // //     this.workPhone,
// // // //     required this.workEmail,
// // // //     required this.employeeId,
// // // //     required this.gender,
// // // //     this.bloodGroup,
// // // //     this.nid,
// // // //     required this.department,
// // // //     required this.jobPosition,
// // // //     required this.manager,
// // // //     required this.workAddress,
// // // //     required this.workLocation,
// // // //     required this.joiningDate,
// // // //     this.promotionDate,
// // // //     this.separationDate,
// // // //     required this.workingHours,
// // // //     this.image,
// // // //   });

// // // //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// // // //     return UserProfile(
// // // //       name: json['name'] ?? 'Unknown',
// // // //       workPhone: json['mobile'],
// // // //       workEmail: json['work_email'] ?? 'no-email@domain.com',
// // // //       employeeId: json['employee_id'] ?? 'Unknown',
// // // //       gender: _parseGender(json['gender'] ?? 'other'),
// // // //       bloodGroup: _parseBloodGroup(json['blood_group'] ?? 'unknown'),  // Handling null and unknown values
// // // //       nid: json['nid'],
// // // //       department: json['department_id'] ?? 'Unknown Department',
// // // //       jobPosition: json['job_id'] ?? 'Unknown Position',
// // // //       manager: json['manager'] ?? 'No Manager',
// // // //       workAddress: json['work_address'] ?? 'No Address',
// // // //       workLocation: json['work_location'] ?? 'Unknown Location',
// // // //       joiningDate: DateTime.tryParse(json['joining_date']) ?? DateTime.now(),
// // // //       promotionDate: json['promotion_date'] != false
// // // //           ? DateTime.tryParse(json['promotion_date'])
// // // //           : null,
// // // //       separationDate: json['separation_date'] != false
// // // //           ? DateTime.tryParse(json['separation_date'])
// // // //           : null,
// // // //       workingHours: json['work_hours'] ?? 'N/A',
// // // //       image: json['image_1920'],
// // // //     );
// // // //   }

// // // //   static Gender _parseGender(String genderString) {
// // // //     switch (genderString.toLowerCase()) {
// // // //       case 'male':
// // // //         return Gender.Male;
// // // //       case 'female':
// // // //         return Gender.Female;
// // // //       default:
// // // //         return Gender.Other;
// // // //     }
// // // //   }

// // // //   static BloodGroup? _parseBloodGroup(String bloodGroupString) {
// // // //     final normalizedBloodGroup = bloodGroupString.toLowerCase();
    
// // // //     print('Parsing blood group: $bloodGroupString');  // Log the blood group for debugging

// // // //     switch (normalizedBloodGroup) {
// // // //       case 'a+':
// // // //         return BloodGroup.APlus;
// // // //       case 'a-':
// // // //         return BloodGroup.AMinus;
// // // //       case 'b+':
// // // //         return BloodGroup.BPlus;
// // // //       case 'b-':
// // // //         return BloodGroup.BMinus;
// // // //       case 'o+':
// // // //         return BloodGroup.OPlus;
// // // //       case 'o-':
// // // //         return BloodGroup.OMinus;
// // // //       case 'ab+':
// // // //         return BloodGroup.ABPlus;
// // // //       case 'ab-':
// // // //         return BloodGroup.ABMinus;
// // // //       default:
// // // //         print('Unknown blood group: $bloodGroupString');  // Log unexpected values
// // // //         return null;  // Gracefully handle unknown blood groups
// // // //     }
// // // //   }
// // // // }

// // import 'dart:convert';

// // /// Enum for gender selection
// // enum Gender { Male, Female, Other }

// // /// Enum for blood group selection
// // enum BloodGroup { APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus }

// // /// UserProfile model class
// // class UserProfile {
// //   final String name;
// //   dynamic workPhone;
// //   final String workEmail;
// //   final String employeeId;
// //   final Gender gender;
// //   final BloodGroup bloodGroup;
// //   dynamic nid;
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

// //   UserProfile({
// //     required this.name,
// //     this.workPhone,
// //     required this.workEmail,
// //     required this.employeeId,
// //     required this.gender,
// //     required this.bloodGroup,
// //     this.nid,
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

// //   /// Factory constructor to create UserProfile from JSON
// //   factory UserProfile.fromJson(Map<String, dynamic> json) {
// //     return UserProfile(
// //       name: json['name'],
// //       workPhone: json['mobile'],
// //       workEmail: json['work_email'],
// //       employeeId: json['employee_id'],
// //       gender: _parseGender(json['gender']),
// //       bloodGroup: _parseBloodGroup(json['blood_group']),
// //       nid: json['nid'],
// //       department: json['department_id'],
// //       jobPosition: json['job_id'],
// //       manager: json['manager'],
// //       workAddress: json['work_address'],
// //       workLocation: json['work_location'] ?? 'N/A',
// //       joiningDate: DateTime.parse(json['joining_date']),
// //       promotionDate: json['promotion_date'] != false ? DateTime.parse(json['promotion_date']) : null,
// //       separationDate: json['separation_date'] != false ? DateTime.parse(json['separation_date']) : null,
// //       workingHours: json['work_hours'],
// //       image: json['image_1920'],
// //     );
// //   }

// //   static Gender _parseGender(String genderString) {
// //     switch (genderString.toLowerCase()) {
// //       case 'male':
// //         return Gender.Male;
// //       case 'female':
// //         return Gender.Female;
// //       default:
// //         return Gender.Other;
// //     }
// //   }

// //   static BloodGroup _parseBloodGroup(String bloodGroupString) {
// //     switch (bloodGroupString.toLowerCase()) {
// //       case 'a+':
// //         return BloodGroup.APlus;
// //       case 'a-':
// //         return BloodGroup.AMinus;
// //       case 'b+':
// //         return BloodGroup.BPlus;
// //       case 'b-':
// //         return BloodGroup.BMinus;
// //       case 'o+':
// //         return BloodGroup.OPlus;
// //       case 'o-':
// //         return BloodGroup.OMinus;
// //       case 'ab+':
// //         return BloodGroup.ABPlus;
// //       case 'ab-':
// //         return BloodGroup.ABMinus;
// //       default:
// //         throw Exception('Invalid blood group');
// //     }
// //   }
// // }


// // Define BloodGroup Enum
// enum BloodGroup {
//   APlus, AMinus, BPlus, BMinus, OPlus, OMinus, ABPlus, ABMinus
// }

// // Define Gender Enum (in case it's also missing)
// enum Gender {
//   Male, Female, Other
// }

// class UserProfile {
//   final String name;
//   dynamic workPhone;
//   final String workEmail;
//   final String employeeId;
//   final Gender gender;
//   final BloodGroup bloodGroup;
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

//   UserProfile({
//     required this.name,
//     this.workPhone,
//     required this.workEmail,
//     required this.employeeId,
//     required this.gender,
//     required this.bloodGroup,
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

//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       name: json['name'] ?? 'N/A',
//       workPhone: json['mobile'] ?? '',
//       workEmail: json['work_email'] ?? 'N/A',
//       employeeId: json['employee_id'] ?? 'N/A',
//       gender: _parseGender(json['gender'] ?? 'other'),
//       bloodGroup: _parseBloodGroup(json['blood_group'] ?? 'o+'),
//       nid: json['nid'] ?? '',
//       department: json['department_id'] ?? 'N/A',
//       jobPosition: json['job_id'] ?? 'Position not available',
//       manager: json['manager'] ?? 'N/A',
//       workAddress: json['work_address'] ?? 'N/A',
//       workLocation: json['work_location'] ?? 'N/A',
//       joiningDate: DateTime.parse(json['joining_date'] ?? DateTime.now().toIso8601String()),
//       promotionDate: json['promotion_date'] != null && json['promotion_date'] != false
//           ? DateTime.parse(json['promotion_date'])
//           : null,
//       separationDate: json['separation_date'] != null && json['separation_date'] != false
//           ? DateTime.parse(json['separation_date'])
//           : null,
//       workingHours: json['work_hours'] ?? 'N/A',
//       image: json['image_1920'] ?? '',
//     );
//   }

//   static Gender _parseGender(String genderString) {
//     switch (genderString.toLowerCase()) {
//       case 'male':
//         return Gender.Male;
//       case 'female':
//         return Gender.Female;
//       default:
//         return Gender.Other;
//     }
//   }

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
// }
class UserProfile {
  final int id;
  final String name;
  final String workEmail;
  final String mobile;
  final String image1920;
  final String departmentId;
  final String jobId;
  final String joiningDate;
  final String? separationDate; // nullable (because it can be false or string)
  final String workLocation;
  final String gender;
  final String bloodGroup;
  final String employeeId;
  final String manager;
  final String workAddress;
  final String promotionDate;
  final String workHours;
  final String nid;

  UserProfile({
    required this.id,
    required this.name,
    required this.workEmail,
    required this.mobile,
    required this.image1920,
    required this.departmentId,
    required this.jobId,
    required this.joiningDate,
    this.separationDate, // nullable
    required this.workLocation,
    required this.gender,
    required this.bloodGroup,
    required this.employeeId,
    required this.manager,
    required this.workAddress,
    required this.promotionDate,
    required this.workHours,
    required this.nid,
  });

  // Factory constructor to create a UserProfile instance from JSON
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      workEmail: json['work_email'] as String,
      mobile: json['mobile'] as String,
      image1920: json['image_1920'] as String,
      departmentId: json['department_id'] as String,
      jobId: json['job_id'] as String,
      joiningDate: json['joining_date'] as String,
      separationDate: json['separation_date'] == false
          ? null
          : json['separation_date'] as String?, // Handles the case where it's false
      workLocation: json['work_location'] as String,
      gender: json['gender'] as String,
      bloodGroup: json['blood_group'] as String,
      employeeId: json['employee_id'] as String,
      manager: json['manager'] as String,
      workAddress: json['work_address'] as String,
      promotionDate: json['promotion_date'] as String,
      workHours: json['work_hours'] as String,
      nid: json['nid'] as String,
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'work_email': workEmail,
      'mobile': mobile,
      'image_1920': image1920,
      'department_id': departmentId,
      'job_id': jobId,
      'joining_date': joiningDate,
      'separation_date': separationDate ?? false, // null becomes false
      'work_location': workLocation,
      'gender': gender,
      'blood_group': bloodGroup,
      'employee_id': employeeId,
      'manager': manager,
      'work_address': workAddress,
      'promotion_date': promotionDate,
      'work_hours': workHours,
      'nid': nid,
    };
  }
}
