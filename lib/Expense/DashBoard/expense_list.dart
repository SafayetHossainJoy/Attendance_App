import 'package:flutter/material.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Map<String, String>> expenses = [
    {'date': '01 May 2024', 'category': 'Travel', 'status': 'Submitted', 'amount': '\৳200'},
    {'date': '03 May 2024', 'category': 'Meals', 'status': 'Approved', 'amount': '\৳50'},
    {'date': '04 May 2024', 'category': 'Supplies', 'status': 'Pending', 'amount': '\৳100'},
    {'date': '05 May 2024', 'category': 'Travel', 'status': 'Approved', 'amount': '\৳200'},
    {'date': '06 May 2024', 'category': 'Meals', 'status': 'Submitted', 'amount': '\৳50'},
    {'date': '07 May 2024', 'category': 'Supplies', 'status': 'Pending', 'amount': '\৳100'},
    {'date': '08 May 2024', 'category': 'Travel', 'status': 'Submitted', 'amount': '\৳800'},
    {'date': '09 May 2024', 'category': 'Meals', 'status': 'Approved', 'amount': '\৳50'},
    {'date': '10 May 2024', 'category': 'Supplies', 'status': 'Pending', 'amount': '\৳600'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(
          date: expenses[index]['date']!,
          category: expenses[index]['category']!,
          status: expenses[index]['status']!,
          amount: expenses[index]['amount']!,
        );
      },
    );
  }
}
