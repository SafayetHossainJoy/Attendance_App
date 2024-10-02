import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'leave_summary_card.dart';

class LeaveCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LeaveCard(
          icon: FontAwesomeIcons.calendarAlt,
          title: 'Annual Leave',
          value: '10',
          color: Colors.blue,
        ),
        LeaveCard(
          icon: FontAwesomeIcons.firstAid,
          title: 'Sick Leave',
          value: '14',
          color: Colors.orange,
        ),
        LeaveCard(
          icon: FontAwesomeIcons.umbrellaBeach,
          title: 'Casual Leave',
          value: '10',
          color: Colors.green,
        ),
      ],
    );
  }
}
