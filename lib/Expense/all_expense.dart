import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final _formKey = GlobalKey<FormState>();
  String? _description;
  String? _selectedCategory;
  String? _selectedEmployee;
  String? _paidBy;
  DateTime? _expenseDate;
  double? _amount;
  XFile? _receiptImage;
  String? _receiptFilePath;
  String? _receiptFileName;
  final _noteController = TextEditingController();

  final _categories = ['Travel', 'Food', 'Accommodation', 'Other'];
  final _employees = ['Employee 1', 'Employee 2', 'Employee 3'];
  final _paidByOptions = ['Employee', 'Company'];

  @override
  void initState() {
    super.initState();
    _expenseDate = DateTime.now();
    _loadExpenseData();
  }

  Future<void> _pickReceipt() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx'
      ],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _receiptFilePath = file.path;
        _receiptFileName = file.name;
        _receiptImage = null;
      });
      if (['jpg', 'jpeg', 'png'].contains(file.extension)) {
        _receiptImage = XFile(file.path!);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _expenseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _expenseDate) {
      setState(() {
        _expenseDate = pickedDate;
      });
    }
  }

  Future<void> _saveExpenseData() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> expenseData = {
        'description': _description,
        'category': _selectedCategory,
        'employee': _selectedEmployee,
        'paidBy': _paidBy,
        'expenseDate': _expenseDate?.toIso8601String(),
        'amount': _amount,
        'note': _noteController.text,
        'receipt': _receiptFilePath,
        'receiptFileName': _receiptFileName,
      };
      await prefs.setString('expenseData', json.encode(expenseData));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense saved successfully')),
      );
    }
  }

  Future<void> _submitExpenseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? expenseDataString = prefs.getString('expenseData');
    if (expenseDataString != null) {
      Map<String, dynamic> expenseData = json.decode(expenseDataString);
      print('Submitted Expense Data:');
      print('Description: ${expenseData['description']}');
      print('Category: ${expenseData['category']}');
      print('Employee: ${expenseData['employee']}');
      print('Paid By: ${expenseData['paidBy']}');
      print('Expense Date: ${expenseData['expenseDate']}');
      print('Amount: ${expenseData['amount']}');
      print('Note: ${expenseData['note']}');
      print('Receipt: ${expenseData['receipt']}');
      print('Receipt File Name: ${expenseData['receiptFileName']}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense submitted successfully')),
      );
      _clearForm();
      await prefs.remove('expenseData');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No expense data to submit')),
      );
    }
  }

  void _clearForm() {
    setState(() {
      _formKey.currentState?.reset();
      _description = null;
      _selectedCategory = null;
      _selectedEmployee = null;
      _paidBy = null;
      _expenseDate = DateTime.now();
      _amount = null;
      _receiptFilePath = null;
      _receiptFileName = null;
      _receiptImage = null;
      _noteController.clear();
    });
  }

  Future<void> _loadExpenseData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? expenseDataString = prefs.getString('expenseData');
    if (expenseDataString != null) {
      Map<String, dynamic> expenseData = json.decode(expenseDataString);
      setState(() {
        _description = expenseData['description'];
        _selectedCategory = expenseData['category'];
        _selectedEmployee = expenseData['employee'];
        _paidBy = expenseData['paidBy'];
        _expenseDate = DateTime.tryParse(expenseData['expenseDate'] ?? '');
        _amount = expenseData['amount'];
        _noteController.text = expenseData['note'];
        _receiptFilePath = expenseData['receipt'];
        _receiptFileName = expenseData['receiptFileName'];
        if (_receiptFilePath != null &&
            ['jpg', 'jpeg', 'png']
                .contains(_receiptFilePath!.split('.').last)) {
          _receiptImage = XFile(_receiptFilePath!);
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Widget _buildReceiptPreview() {
    final double previewSize = 150.0; // Adjust as needed

    if (_receiptImage != null) {
      return Column(
        children: [
          Container(
            height: previewSize,
            width: previewSize,
            child: Image.file(File(_receiptImage!.path)),
          ),
          const SizedBox(height: 8),
          const Text('Receipt Attached'), // Status message
        ],
      );
    } else if (_receiptFileName != null) {
      return Column(
        children: [
          Text('Receipt: $_receiptFileName'),
          const SizedBox(height: 8),
          const Text('File Attached'), // Status message
        ],
      );
    } else {
      return const Text('No receipt attached'); // Status message
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                color: Colors.deepPurple[50],
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          prefixIcon:
                              const Icon(Icons.description, color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          _description = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          prefixIcon:
                              const Icon(Icons.category, color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: _selectedCategory,
                        items: _categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Employee',
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: _selectedEmployee,
                        items: _employees.map((employee) {
                          return DropdownMenuItem(
                            value: employee,
                            child: Text(employee),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedEmployee = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Paid By',
                          prefixIcon:
                              const Icon(Icons.payment, color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: _paidBy,
                        items: _paidByOptions.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _paidBy = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Total (Taka)',
                          prefixIcon: const Icon(Icons.attach_money,
                              color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _amount = double.tryParse(value);
                        },
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        tileColor: Colors.deepPurple[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(
                          _expenseDate == null
                              ? 'Expense Date'
                              : 'Expense Date:  ${_formatDate(_expenseDate!)}',
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.calendar_today,
                            color: Colors.deepPurple),
                        onTap: () => _selectDate(context),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        tileColor: Colors.deepPurple[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: _buildReceiptPreview(),
                        trailing: const Icon(Icons.attach_file,
                            color: Colors.deepPurple),
                        onTap: _pickReceipt,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Note',
                          prefixIcon:
                              const Icon(Icons.note, color: Colors.deepPurple),
                          filled: true,
                          fillColor: Colors.deepPurple[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: _noteController,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveExpenseData,
                    child: const Text('Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 219, 206, 241),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

