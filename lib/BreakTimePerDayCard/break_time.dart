import 'package:flutter/material.dart';

class BreakTimePerDayCard extends StatefulWidget {
  final String avgTime;

  const BreakTimePerDayCard({
    Key? key,
    required this.avgTime, required String breakTime,
  }) : super(key: key);

  @override
  _BreakTimePerDayCardState createState() => _BreakTimePerDayCardState();
}

class _BreakTimePerDayCardState extends State<BreakTimePerDayCard> {
  bool isOnBreak = false;
  DateTime? breakStartTime;
  int breakDuration = 0; // in minutes
  int totalBreaks = 0;
  int totalBreakDuration = 0;

  void startBreak() {
    setState(() {
      isOnBreak = true;
      breakStartTime = DateTime.now();
    });
  }

  void endBreak() {
    setState(() {
      isOnBreak = false;
      // Calculate break duration
      DateTime breakEndTime = DateTime.now();
      Duration duration = breakEndTime.difference(breakStartTime!);
      breakDuration = duration.inMinutes;
      totalBreakDuration += breakDuration;
      totalBreaks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isOnBreak) ...[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  startBreak();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/BTime.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Break Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        if (isOnBreak) ...[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  endBreak();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/BTime.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'End Break',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Roboto'),
            children: [
              TextSpan(
                text: '${isOnBreak ? 'Running' : '$breakDuration minutes'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Roboto'),
            children: [
              const TextSpan(
                text: 'Average Time: ',
              ),
              TextSpan(
                text: '${totalBreaks == 0 ? '0' : (totalBreakDuration / totalBreaks).toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: ' minutes',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
