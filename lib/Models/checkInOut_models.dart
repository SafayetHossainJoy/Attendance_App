

// Mock data model representing a check-in/check-out record
class CheckInOutRecord {
  final DateTime checkInTime;
  final DateTime checkOutTime;

  CheckInOutRecord({
    required this.checkInTime,
    required this.checkOutTime,
  });
}

// Mock function to fetch employee check-in/check-out records for the last month
List<CheckInOutRecord> fetchCheckInOutRecordsForLastMonth() {
  // This is where you would typically fetch data from your database
  // For this example, we'll return some mock data for the last 30 days
  List<CheckInOutRecord> records = [];

  DateTime now = DateTime.now();
  for (int i = 0; i < 30; i++) {
    DateTime date = now.subtract(Duration(days: i));
    // Simulate random check-in and check-out times for demonstration
    DateTime checkInTime = DateTime(date.year, date.month, date.day, 8, 0); // 8:00 AM
    DateTime checkOutTime = DateTime(date.year, date.month, date.day, 17, 0); // 5:00 PM
    records.add(CheckInOutRecord(checkInTime: checkInTime, checkOutTime: checkOutTime));
  }

  return records;
}