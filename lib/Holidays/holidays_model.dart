class Holiday {
  final int id;
  final String name;
  final DateTime dateFrom;
  final DateTime dateTo;
  final dynamic resourceId;  // 'false' is used, which can be bool or null, hence dynamic.
  final String timeType;
  final dynamic calendarId;  // false or String, hence dynamic

  Holiday({
    required this.id,
    required this.name,
    required this.dateFrom,
    required this.dateTo,
    required this.resourceId,
    required this.timeType,
    required this.calendarId,
  });

  // Factory constructor to create a Holiday from a JSON object
  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      id: json['id'] as int,
      name: json['name'] as String,
      dateFrom: DateTime.parse(json['date_from'] as String),
      dateTo: DateTime.parse(json['date_to'] as String),
      resourceId: json['resource_id'],  // can be false or null
      timeType: json['time_type'] as String,
      calendarId: json['calendar_id'],  // can be false or String
    );
  }

  // Method to convert the Holiday instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date_from': dateFrom.toIso8601String(),
      'date_to': dateTo.toIso8601String(),
      'resource_id': resourceId,
      'time_type': timeType,
      'calendar_id': calendarId,
    };
  }
}