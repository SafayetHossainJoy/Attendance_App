import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'summary_card.dart';

class SummaryCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SummaryCard(
          icon: FontAwesomeIcons.bangladeshiTakaSign,
          title: 'Total Expenses',
          value: '\৳1500',
          color: Colors.blue,
        ),
        SummaryCard(
          icon: FontAwesomeIcons.clock,
          title: 'Pending',
          value: '\৳500',
          color: Colors.orange,
        ),
        SummaryCard(
          icon: FontAwesomeIcons.checkCircle,
          title: 'Approved',
          value: '\৳1000',
          color: Colors.green,
        ),
      ],
    );
  }
}
