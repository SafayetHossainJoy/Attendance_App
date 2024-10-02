// // import 'package:flutter/material.dart';

// // class LeaveDetailPage extends StatelessWidget {
// //   final String dateRange;
// //   final String status;
// //   final String applyDays;
// //   final String leaveType;
// //   final String approvedBy;
// //   final String leavereason;


// //   const LeaveDetailPage({
// //     Key? key,
// //     required this.dateRange,
// //     required this.status,
// //     required this.applyDays,
// //     required this.leaveType,
// //     required this.approvedBy,
// //     required this.leavereason,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Leave Details'),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Date Range: $dateRange',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Status: $status',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Apply Days: $applyDays',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Leave Type: $leaveType',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Reason for Leave: $leavereason',
// //               style: TextStyle(fontSize: 18),
// //             ),SizedBox(height: 10),
// //             Text(
// //               'Approved By: $approvedBy',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class LeaveDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leave Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Leave Type
//             _detailCard(
//               title: 'Leave Type',
//               content: 'Annual Leave',
//             ),
//             SizedBox(height: 10),

//             // Leave Duration
//             _detailCard(
//               title: 'Duration',
//               content: '5 Days (12th Oct 2024 - 16th Oct 2024)',
//             ),
//             SizedBox(height: 10),

//             // Leave Status
//             _detailCard(
//               title: 'Status',
//               content: 'Pending Approval',
//             ),
//             SizedBox(height: 10),

//             // Leave Reason
//             _detailCard(
//               title: 'Reason',
//               content: 'Family Vacation',
//             ),
//             SizedBox(height: 20),

//             // Approve/Reject Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Logic for approval
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Leave Approved')),
//                     );
//                   },
//                   child: Text('Approve'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Logic for rejection
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Leave Rejected')),
//                     );
//                   },
//                   child: Text('Reject'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper widget to create a card displaying a title and content
//   Widget _detailCard({required String title, required String content}) {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(content),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LeaveDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        title: Text('Leave Details'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Custom app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Icon and Gradient Background
            _headerSection(),
            SizedBox(height: 20),

            // Leave Type
            _detailCard(
              icon: Icons.beach_access,
              title: 'Leave Type',
              content: 'Annual Leave',
            ),
            SizedBox(height: 10),

            // Leave Duration
            _detailCard(
              icon: Icons.calendar_today,
              title: 'Duration',
              content: '5 Days (12th Oct 2024 - 16th Oct 2024)',
            ),
            SizedBox(height: 10),

            // Leave Status
            _detailCard(
              icon: Icons.pending_actions,
              title: 'Status',
              content: 'Pending Approval',
            ),
            SizedBox(height: 10),

            // Leave Reason
            _detailCard(
              icon: Icons.message,
              title: 'Reason',
              content: 'Family Vacation',
            ),
            SizedBox(height: 30),

            // Approve/Reject Buttons with Animation
            _actionButtons(context),
          ],
        ),
      ),
    );
  }

  // Header with a decorative banner
  Widget _headerSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.assignment_turned_in,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Leave Request',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget to create a card with an icon, title, and content
  Widget _detailCard({required IconData icon, required String title, required String content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: Colors.teal),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Approve/Reject buttons with custom style
  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _animatedButton(
          label: 'Approve',
          color: Colors.green,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Leave Approved')),
            );
          },
        ),
        _animatedButton(
          label: 'Reject',
          color: Colors.red,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Leave Rejected')),
            );
          },
        ),
      ],
    );
  }

  // Reusable button with animation and custom styling
  Widget _animatedButton({required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
