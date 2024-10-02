// import 'package:flutter/material.dart';
// import 'package:hrms/Leaves/leave.dart';
// import 'package:hrms/Leaves/GridItem_leave.dart';

// class LeavePage extends StatefulWidget {
//   @override
//   State<LeavePage> createState() => _LeavePageState();
// }

// class _LeavePageState extends State<LeavePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   Color _indicatorColor = const Color(0xFF1976D2); // Default indicator color

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(_updateIndicatorColor);
//   }

//   void _updateIndicatorColor() {
//     setState(() {
//       // Check the current index of the tab controller
//       if (_tabController.index == 0) {
//         // If the Upcoming tab is selected, set indicator color to Dark Blue
//         _indicatorColor = const Color(0xFF1976D2);
//       } else {
//         // Otherwise, set indicator color to Dark Green for the Past tab
//         _indicatorColor = const Color(0xFF388E3C);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final gridHeight = screenHeight * 0.46; // Adjusted height
//     final buttonHeight = screenHeight * 0.05; // Adjusted height

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 2,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: const Text(
//             'All Leaves',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Poppins-Medium',
//             ),
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: gridHeight,
//               child: SingleChildScrollView(
//                 child: GridView.count(
//                   shrinkWrap: true,
//                   crossAxisCount: 2, // Keep this as 2 to create a 2x2 grid
//                   mainAxisSpacing: 10.0,
//                   crossAxisSpacing: 10.0,
//                   padding: const EdgeInsets.all(10.0),
//                   children: const <Widget>[
//                     GridItem(
//                       title: 'Annual Leave',
//                       subtitle: '20',
//                       color: Color.fromRGBO(220, 255, 190, 0.9),
//                     ),
//                     GridItem(
//                       title: 'Sick Leave',
//                       subtitle: '2',
//                       color: Color.fromRGBO(190, 235, 255, 0.9),
//                     ),
//                     GridItem(
//                       title: 'Casual Leave',
//                       subtitle: '4',
//                       color: Color.fromRGBO(255, 230, 180, 0.9),
//                     ),
//                     // GridItem(
//                     //   title: 'Leave Cancelled',
//                     //   subtitle: '10',
//                     //   color: Color.fromRGBO(255, 200, 200, 0.9),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: buttonHeight,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: buttonHeight,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) => ApplyForLeavePage()),
//                       );
//                     },
//                     child: const Text(
//                       'Apply for Leave',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xFFFF3838)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Column(
//                 children: [
//                   Material(
//                     //color: const Color.fromARGB(255, 178, 214, 243),
//                     child: TabBar(
//                       controller: _tabController,
//                       labelColor: const Color(
//                           0xFFFF3838), // Selected text and icon color
//                       unselectedLabelColor:
//                           Colors.black54, // Unselected text and icon color
//                       indicatorColor: _indicatorColor,
//                       tabs: const [
//                         Tab(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.upcoming,
//                                   color: Color(0xFF1976D2)), // Icon
//                               SizedBox(width: 5), // Space between icon and text
//                               Text('Upcoming',
//                                   style: TextStyle(
//                                       color: Color(0xFF1976D2))), // Text
//                             ],
//                           ),
//                         ),
//                         Tab(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.archive,
//                                   color: Color(
//                                       0xFF388E3C)), // Icon with Dark Green color
//                               SizedBox(width: 5), // Space between icon and text
//                               Text('Past',
//                                   style: TextStyle(
//                                       color: Color(
//                                           0xFF388E3C))), // Text with Dark Green color
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         Builder(
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: ListView.builder(
//                               itemCount: 5, // Specify the itemCount
//                               itemBuilder: (BuildContext context, int index) {
//                                 return const Card(
//                                   elevation:
//                                       2.0, // Add elevation for a shadow effect
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.stretch,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Date',
//                                                       style: TextStyle(
//                                                         fontSize: 18.0,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily:
//                                                             'Poppins-Medium',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Approved',
//                                                       textAlign:
//                                                           TextAlign.right,
//                                                       style: TextStyle(
//                                                         color: Colors.teal,
//                                                         fontSize: 18.0,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontFamily:
//                                                             'Poppins-Medium',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(height: 20),
//                                               Text(
//                                                 '15 May 2024 - 18 May 2024',
//                                                 style: TextStyle(
//                                                   fontSize: 18.0,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Poppins-Medium',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Divider(
//                                             thickness: 1.0,
//                                             color: Colors.black),
//                                         Padding(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Apply Days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     '3 days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Leave Balance',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     '20 days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Approve By',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     'John Doe',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Builder(
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: ListView.builder(
//                               itemCount: 5, // Specify the itemCount
//                               itemBuilder: (BuildContext context, int index) {
//                                 return const Card(
//                                   elevation:
//                                       2.0, // Add elevation for a shadow effect
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.stretch,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Date',
//                                                       style: TextStyle(
//                                                         fontSize: 18.0,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontFamily:
//                                                             'Poppins-Medium',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Rejected',
//                                                       textAlign:
//                                                           TextAlign.right,
//                                                       style: TextStyle(
//                                                         color:
//                                                             Color(0xFF800000),
//                                                         fontSize: 18.0,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontFamily:
//                                                             'Poppins-Medium',
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(height: 20),
//                                               Text(
//                                                 '15 May 2024 - 18 May 2024',
//                                                 style: TextStyle(
//                                                   fontSize: 18.0,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Poppins-Medium',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Divider(
//                                             thickness: 1.0,
//                                             color: Colors.black),
//                                         Padding(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Apply Days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     '3 days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Leave Balance',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     '20 days',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Approve By',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 10),
//                                                   Text(
//                                                     'John Doe',
//                                                     style: TextStyle(
//                                                       fontSize: 18.0,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           'Poppins-Medium',
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hrms/Leaves/leave.dart';
import 'package:hrms/Leaves/leaveCards.dart';
import 'package:hrms/Leaves/leave_details.dart';

class LeavePage extends StatefulWidget {
  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color _indicatorColor = const Color(0xFF1976D2); // Default indicator color

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_updateIndicatorColor);
  }

  void _updateIndicatorColor() {
    setState(() {
      // Check the current index of the tab controller
      if (_tabController.index == 0) {
        // If the Upcoming tab is selected, set indicator color to Dark Blue
        _indicatorColor = const Color(0xFF1976D2);
      } else {
        // Otherwise, set indicator color to Dark Green for the Past tab
        _indicatorColor = const Color(0xFF388E3C);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final gridHeight = screenHeight * 0.46; // Adjusted height
    final buttonHeight = screenHeight * 0.05; // Adjusted height

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'All Leaves',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins-Medium',
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LeaveCards(),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  Material(
                    //color: const Color.fromARGB(255, 178, 214, 243),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(
                          0xFFFF3838), // Selected text and icon color
                      unselectedLabelColor:
                          Colors.black54, // Unselected text and icon color
                      indicatorColor: _indicatorColor,
                      tabs: const [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upcoming,
                                  color: Color(0xFF1976D2)), // Icon
                              SizedBox(width: 5), // Space between icon and text
                              Text('Upcoming',
                                  style: TextStyle(
                                      color: Color(0xFF1976D2))), // Text
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.archive,
                                  color: Color(
                                      0xFF388E3C)), // Icon with Dark Green color
                              SizedBox(width: 5), // Space between icon and text
                              Text('Past',
                                  style: TextStyle(
                                      color: Color(
                                          0xFF388E3C))), // Text with Dark Green color
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListView.builder(
                              itemCount:
                                  5, // This would be dynamic based on your data
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {},
                                    // Navigate to the details page when a card is tapped
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //       builder: (context) => LeaveDetailPage(
                                  //         dateRange:
                                  //             '15 May 2024 - 18 May 2024', // Sample data
                                  //         status: 'Approved', // Sample data
                                  //         applyDays: '3 days', // Sample data
                                  //         leaveType:
                                  //             'Sick Leave', // Sample data
                                  //         approvedBy: 'John Doe', // Sample data
                                  //       ),
                                  //     ),
                                  //   );
                                  
                                  child: const Card(
                                    elevation: 2.0,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Date',
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Poppins-Medium',
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Approved',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          color: Colors.teal,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Poppins-Medium',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  '15 May 2024 - 18 May 2024',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                              thickness: 1.0,
                                              color: Colors.black),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Apply Days',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      '3 days',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Leave Types',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Sick Leave',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Approve By',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'John Doe',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListView.builder(
                              itemCount: 5, // Specify the itemCount
                              itemBuilder: (BuildContext context, int index) {
                                return const Card(
                                  elevation:
                                      2.0, // Add elevation for a shadow effect
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Date',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Rejected',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF800000),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                '15 May 2024 - 18 May 2024',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins-Medium',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            thickness: 1.0,
                                            color: Colors.black),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Apply Days',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    '3 days',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Leave Types',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Casual Leave',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Approve By',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'John Doe',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ApplyForLeavePage()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
