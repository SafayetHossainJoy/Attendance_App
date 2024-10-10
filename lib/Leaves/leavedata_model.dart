class LeaveData {
  final String leaveType;
  final double leaveValue;

  LeaveData({required this.leaveType, required this.leaveValue});

  factory LeaveData.fromJson(String leaveType, dynamic value) {
    return LeaveData(
      leaveType: leaveType,
      leaveValue: value is double ? value : 0.0,  // Ensures all values are double
    );
  }
}
