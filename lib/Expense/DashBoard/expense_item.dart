import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final String date;
  final String category;
  final String status;
  final String amount;

  ExpenseItem({
    required this.date,
    required this.category,
    required this.status,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'Approved':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Submitted':
      default:
        statusColor = Colors.blue;
    }

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(date.split(' ')[0]),
        ),
        title: Text(
          category,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount,
                style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 4),
            Text(status,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: statusColor)),
          ],
        ),
      ),
    );
  }
}
