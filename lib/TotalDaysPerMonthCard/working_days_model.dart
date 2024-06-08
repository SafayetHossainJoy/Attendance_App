class WorkingDays {
  final double days;
  final double hours;

  WorkingDays({
    required this.days,
    required this.hours,
  });

  factory WorkingDays.fromJson(Map<String, dynamic> json) {
    return WorkingDays(
      days: json['days'] != null ? json['days'].toDouble() : 0.0,
      hours: json['hours'] != null ? json['hours'].toDouble() : 0.0,
    );
  }
}
