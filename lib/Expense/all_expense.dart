import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _clearForm(); // Reset the form after submission
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
    final double previewSize = 150.0;

    if (_receiptImage != null) {
      return Column(
        children: [
          Container(
            height: previewSize,
            width: previewSize,
            child: Image.file(File(_receiptImage!.path)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Receipt Attached',
            style: TextStyle(color: Color(0xFF120078)),
          ),
        ],
      );
    } else if (_receiptFileName != null) {
      return Column(
        children: [
          Text(
            'Receipt: $_receiptFileName',
            style: const TextStyle(color: Color(0xFF120078)),
          ),
          const SizedBox(height: 8),
          const Text(
            'File Attached',
            style: TextStyle(color: Color(0xFF120078)),
          ),
        ],
      );
    } else {
      return const Text(
        'No receipt attached',
        style: TextStyle(color: Color(0xFF120078)),
      );
    }
  }

  Widget _buildFormField({
    required String hintText,
    required Icon prefixIcon,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: Color(0xFF120078),fontWeight: FontWeight.w600), // Set hint text color
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF9D7FEA),
          ), // Set outline border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF9D7FEA),
          ), // Set outline border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF9D7FEA),
          ), // Set outline border color
        ),
        contentPadding: const EdgeInsets.all(12.0),
      ),
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
    );
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
        //automaticallyImplyLeading: false, // Set this to false to remove the leading widget
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Create Expense',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins-Medium',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                color: const Color(0xFFF5F5F5), // Light Gray
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildFormField(
                        hintText: 'Description',
                        prefixIcon: const Icon(Icons.description,
                            color: Color(0xFF120078)), // Deep Blue
                        onChanged: (value) => _description = value,
                      ),
                      const SizedBox(height: 10),
                      CustomDropdown(
                        hintText: 'Category',
                        prefixIcon: const Icon(Icons.category,
                            color: Color(0xFF120078)), // Deep Blue
                        value: _selectedCategory,
                        items: _categories,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomDropdown(
                        hintText: 'Employee',
                        prefixIcon: const Icon(Icons.person,
                            color: Color(0xFF120078)), // Deep Blue
                        value: _selectedEmployee,
                        items: _employees,
                        onChanged: (value) {
                          setState(() {
                            _selectedEmployee = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomDropdown(
                        hintText: 'Paid By',
                        prefixIcon: const Icon(Icons.payment,
                            color: Color(0xFF120078)), // Deep Blue
                        value: _paidBy,
                        items: _paidByOptions,
                        onChanged: (value) {
                          setState(() {
                            _paidBy = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildFormField(
                        hintText:'Total (Taka)',
                        prefixIcon: const Icon(Icons.money_rounded,
                            color: Color(0xFF120078)), // Deep Blue
                        onChanged: (value) => _amount = double.tryParse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color(0xFF9D7FEA)), // Set border color
                        ),
                        child: ListTile(
                          title: Text(
                            _expenseDate == null
                                ? 'Expense Date'
                                : 'Expense Date: ${_formatDate(_expenseDate!)}',
                            style: const TextStyle(
                              color: Color(0xFF120078), // Deep Blue
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: const Icon(Icons.calendar_today,
                              color: Color(0xFF120078)), // Deep Blue
                          onTap: () => _selectDate(context),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color(0xFF9D7FEA)), // Set border color
                        ),
                        child: ListTile(
                          title: _buildReceiptPreview(),
                          trailing: const Icon(Icons.attach_file,
                              color: Color(0xFF120078)), // Deep Blue
                          onTap: _pickReceipt,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildFormField(
                        hintText: 'Note',
                        prefixIcon: const Icon(Icons.note,
                            color: Color(0xFF120078)), // Deep Blue
                        onChanged: (value) => _noteController.text = value,
                        controller: _noteController,
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
                      backgroundColor: const Color(0xFF120078), // Deep Blue
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 14.0),
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
                      backgroundColor: const Color(0xFF9D7FEA), // Light Purple
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 14.0),
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

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    required this.hintText,
    required this.prefixIcon,
    this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light Gray
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFF9D7FEA),
        ),
      ),
      child: Row(
        children: [
          prefixIcon,
          const SizedBox(width: 8), // Add some space between icon and dropdown
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                icon: const Icon(Icons.arrow_drop_down,
                    color: Color(0xFF120078)), // Deep Blue
                iconSize: 24, // Adjust icon size if needed
                isExpanded: true,
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    color: Color(0xFF120078), // Deep Blue
                  ),
                ),
                onChanged: onChanged,
                items: items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Color(0xFF120078), // Deep Blue
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
