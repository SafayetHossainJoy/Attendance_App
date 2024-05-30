import 'package:flutter/material.dart';
import 'package:hrms/Expense/all_expense.dart';
import 'summary_cards.dart';
import 'expense_list.dart';

class ExpenseDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false, // Set this to false to remove the leading widget
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Expense Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins-Medium',
          ),
        ),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SummaryCards(),
            SizedBox(height: 16),
            Expanded(child: ExpenseList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
                 onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ExpensePage()),
            );
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
