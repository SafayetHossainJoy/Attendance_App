// import 'package:flutter/material.dart';
// import 'package:hrms/Login/login.dart';
// import 'package:hrms/Login/login_service.dart';
// import 'employee_history.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   String _selectedMenu = 'Employee History';

//   // Method to select the menu
//   void _selectMenu(String menu) {
//     setState(() {
//       _selectedMenu = menu;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         automaticallyImplyLeading: false, // Set this to false to remove the leading widget
//         elevation: 2,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text(
//           'My Dashboard',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Roboto',
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           // Navigation Buttons
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             color: Colors.blueGrey[50],
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   _buildNavButton(
//                     context,
//                     label: 'Employee History',
//                     isSelected: _selectedMenu == 'Employee History',
//                     onTap: () => _selectMenu('Employee History'),
//                   ),
//                   _buildNavButton(
//                     context,
//                     label: 'Salary Slip',
//                     isSelected: _selectedMenu == 'Salary Slip',
//                     onTap: () => _selectMenu('Salary Slip'),
//                   ),
//                   _buildNavButton(
//                     context,
//                     label: 'Encashment',
//                     isSelected: _selectedMenu == 'Encashment',
//                     onTap: () => _selectMenu('Encashment'),
//                   ),
//                   _buildNavButton(
//                     context,
//                     label: 'Logout',
//                     isSelected: false,
//                     onTap: () {
//                       auth.signOut().then(
//                         (value) => Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (ctx) => LoginPage()),
//                           (route) => false,
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Main Content Area
//           Expanded(
//             child: Center(
//               child: _buildContent(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method to build navigation buttons
//   Widget _buildNavButton(BuildContext context,
//       {required String label, required bool isSelected, required VoidCallback onTap}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: isSelected ? Colors.white : Colors.black, 
//           backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         onPressed: onTap,
//         child: Text(label),
//       ),
//     );
//   }

//   // Method to build content based on selected menu
//   Widget _buildContent() {
//     switch (_selectedMenu) {
//       case 'Employee History':
//         return EmployeeHistoryScreen(); // Replace with the actual screen content
//       case 'Salary Slip':
//         return Center(child: Text('Salary Slip Content', style: TextStyle(fontSize: 24)));
//       case 'Encashment':
//         return Center(child: Text('Encashment Content', style: TextStyle(fontSize: 24)));
//       default:
//         return Center(child: Text('Welcome to My Dashboard', style: TextStyle(fontSize: 24)));
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:hrms/Encashment/encashment.dart';
import 'package:hrms/Login/login.dart';
import 'package:hrms/Login/login_service.dart';
import 'package:hrms/Salary/salary.dart';
import 'employee_history.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedMenu = 'Employee History';

  void _selectMenu(String menu) {
    setState(() {
      _selectedMenu = menu; // Update the selected menu item
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        title: const Text(
          "My Dashboard",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.logout),
        //     onPressed: () {
        //       auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(builder: (ctx) => LoginPage()),
        //         (route) => false,
        //       ));
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
         
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                _createMenuItem(
                  icon: Icons.history,
                  text: 'Employee History',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmployeeHistoryScreen(),
                      ),
                    );
                  },
                ),
                _createMenuItem(
                  icon: Icons.receipt,
                  text: 'Salary Slip',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Salary(),
                      ),
                    );
                  },
                ),
                _createMenuItem(
                  icon: Icons.monetization_on,
                  text: 'Encashment',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Encashment(),
                      ),
                    );
                  },
                ),
                _createMenuItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
              auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (ctx) => LoginPage()),
                (route) => false,
              ));
            },
                ),
                // Add more menu items here as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createMenuItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(text),
        onTap: onTap,
        tileColor: _selectedMenu == text ? Colors.blueAccent.withOpacity(0.1) : Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
