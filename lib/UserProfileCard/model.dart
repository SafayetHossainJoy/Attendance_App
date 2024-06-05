class UserProfile {
  final int id;
  final String name;
  final String workEmail;
  final String workPhone;
  final bool mobile;
  final String image;
  final String department;
  final String jobId;

  UserProfile({
    required this.id,
    required this.name,
    required this.workEmail,
    required this.workPhone,
    required this.mobile,
    required this.image,
    required this.department,
    required this.jobId,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      workEmail: json['work_email'],
      workPhone: json['work_phone'],
      mobile: json['mobile'],
      image: json['image_1920'],
      department: json['department_id'],
      jobId: json['job_id'],
    );
  }
}
