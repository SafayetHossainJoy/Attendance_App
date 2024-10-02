import 'package:flutter/material.dart';

class LeaveRequest {
  final String employeeName;
  final String leaveType;
  final String duration;
  bool isSelected; // This will track if the request is selected for action.

  LeaveRequest({
    required this.employeeName,
    required this.leaveType,
    required this.duration,
    this.isSelected = false,
  });
}

class LeaveApprovalPage extends StatefulWidget {
  @override
  _LeaveApprovalPageState createState() => _LeaveApprovalPageState();
}

class _LeaveApprovalPageState extends State<LeaveApprovalPage> {
  // Dummy list of leave requests
  final List<LeaveRequest> leaveRequests = [
    LeaveRequest(employeeName: 'John Doe', leaveType: 'Annual Leave', duration: '5 Days'),
    LeaveRequest(employeeName: 'Jane Smith', leaveType: 'Sick Leave', duration: '2 Days'),
    LeaveRequest(employeeName: 'Chris Brown', leaveType: 'Casual Leave', duration: '1 Day'),
    LeaveRequest(employeeName: 'Emma Stone', leaveType: 'Maternity Leave', duration: '30 Days'),
    LeaveRequest(employeeName: 'Mike Johnson', leaveType: 'Paternity Leave', duration: '10 Days'),
  ];

  // Helper function to select or deselect all
  void _selectAll(bool isSelected) {
    setState(() {
      leaveRequests.forEach((leave) {
        leave.isSelected = isSelected;
      });
    });
  }

  // Function to approve selected leave requests
  void _approveSelected() {
    List<LeaveRequest> selectedRequests =
        leaveRequests.where((leave) => leave.isSelected).toList();

    if (selectedRequests.isNotEmpty) {
      setState(() {
        selectedRequests.forEach((leave) {
          leave.isSelected = false; // Deselect after action
          // Perform approval logic here
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Approved ${selectedRequests.length} leave requests')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No requests selected')),
      );
    }
  }

  // Function to reject selected leave requests
  void _rejectSelected() {
    List<LeaveRequest> selectedRequests =
        leaveRequests.where((leave) => leave.isSelected).toList();

    if (selectedRequests.isNotEmpty) {
      setState(() {
        selectedRequests.forEach((leave) {
          leave.isSelected = false; // Deselect after action
          // Perform rejection logic here
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rejected ${selectedRequests.length} leave requests')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No requests selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Requests'),
        actions: [
          IconButton(
            icon: Icon(Icons.select_all),
            onPressed: () => _selectAll(true), // Select all items
          ),
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () => _selectAll(false), // Deselect all items
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: leaveRequests.length,
              itemBuilder: (context, index) {
                final leave = leaveRequests[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: leave.isSelected,
                      onChanged: (bool? selected) {
                        setState(() {
                          leave.isSelected = selected ?? false;
                        });
                      },
                    ),
                    title: Text(
                      leave.employeeName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Leave Type: ${leave.leaveType}'),
                        Text('Duration: ${leave.duration}'),
                      ],
                    ),
                    trailing: leave.isSelected
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.circle_outlined, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Approve Selected Button
                ElevatedButton.icon(
                  icon: Icon(Icons.check),
                  label: Text('Approve'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _approveSelected,
                ),
                // Reject Selected Button
                ElevatedButton.icon(
                  icon: Icon(Icons.cancel),
                  label: Text('Reject'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _rejectSelected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
