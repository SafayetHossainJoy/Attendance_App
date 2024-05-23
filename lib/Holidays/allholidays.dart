// import 'package:attendance/BottomNavigation/bottomnav.dart';
// import 'package:attendance/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Holiday {
  final String name;
  final DateTime date;
  final Color iconColor; // Added a property for icon color
  final IconData icon;

  Holiday({
    required this.name,
    required this.date,
    required this.icon,
    required this.iconColor,
  });
}

class HolidaysListPage extends StatelessWidget {
  final List<Holiday> holidays = [
    Holiday(
      name: "Valentine's Day",
      date: DateTime(2024, 2, 14),
      icon: Icons.favorite,
      iconColor: Colors.pink,
    ),
    Holiday(
      name: "Father's Day",
      date: DateTime(2024, 6, 16),
      icon: Icons.favorite_border,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "Mother's Day",
      date: DateTime(2024, 5, 12),
      icon: Icons.favorite_border,
      iconColor: Colors.pink,
    ),
     Holiday(
      name: "Veterans Day",
      date: DateTime(2024, 11, 11),
      icon: Icons.airplanemode_active,
      iconColor: Colors.green,
    ),
    Holiday(
      name: "Presidents Day",
      date: DateTime(2024, 2, 19),
      icon: Icons.account_balance,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "Earth Day",
      date: DateTime(2024, 4, 22),
      icon: Icons.public,
      iconColor: Colors.green,
    ),

    Holiday(
      name: "National Women's Day",
      date: DateTime(2024, 8, 9),
      icon: Icons.face,
      iconColor: Colors.pink,
    ),
    Holiday(
      name: "World Environment Day",
      date: DateTime(2024, 6, 5),
      icon: Icons.nature_people,
      iconColor: Colors.green,
    ),
    Holiday(
      name: "World Health Day",
      date: DateTime(2024, 4, 7),
      icon: Icons.favorite,
      iconColor: Colors.red,
    ),
        Holiday(
      name: "St. Patrick's Day",
      date: DateTime(2024, 3, 17),
      icon: Icons.local_drink,
      iconColor: Colors.green,
    ),
    Holiday(
      name: "World Humanitarian Day",
      date: DateTime(2024, 8, 19),
      icon: Icons.people,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "International Day of Happiness",
      date: DateTime(2024, 3, 20),
      icon: Icons.sentiment_satisfied,
      iconColor: Colors.yellow,
    ),
    Holiday(
      name: "International Day of Peace",
      date: DateTime(2024, 9, 21),
      icon: Icons.airplanemode_active,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "World Water Day",
      date: DateTime(2024, 3, 22),
      icon: Icons.invert_colors,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "International Women's Day",
      date: DateTime(2024, 3, 8),
      icon: Icons.face,
      iconColor: Colors.pink,
    ),
    Holiday(
      name: "International Day of Families",
      date: DateTime(2024, 5, 15),
      icon: Icons.family_restroom,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "World Food Day",
      date: DateTime(2024, 10, 16),
      icon: Icons.fastfood,
      iconColor: Colors.green,
    ),
    Holiday(
      name: "World Kindness Day",
      date: DateTime(2024, 11, 13),
      icon: Icons.favorite,
      iconColor: Colors.red,
    ),
    Holiday(
      name: "New Year's Day",
      date: DateTime(2024, 1, 1),
      icon: Icons.party_mode,
      iconColor: Colors.red, // Color for New Year's Day icon
    ),
    Holiday(
      name: "Independence Day",
      date: DateTime(2024, 7, 4),
      icon: Icons.flag,
      iconColor: Colors.blue, // Color for Independence Day icon
    ),
    Holiday(
      name: "Thanksgiving",
      date: DateTime(2024, 11, 28),
      icon: Icons.local_dining,
      iconColor: Colors.orange, // Color for Thanksgiving icon
    ),

    Holiday(
      name: "Labor Day",
      date: DateTime(2024, 9, 2),
      icon: Icons.work,
      iconColor: Colors.blue,
    ),
    Holiday(
      name: "Columbus Day",
      date: DateTime(2024, 10, 14),
      icon: Icons.map,
      iconColor: Colors.brown,
    ),
    Holiday(
      name: "Memorial Day",
      date: DateTime(2024, 5, 27),
      icon: Icons.airplanemode_active,
      iconColor: Colors.red,
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //  onPressed: () {
        //     Navigator.of(context).pop(
        //       MaterialPageRoute(builder: (context) => HomePage()),
        //     );
        //   },
        // ),
        automaticallyImplyLeading: false, // Set this to false to remove the leading widget
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Holidays List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: holidays.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  holidays[index].icon,
                  size: 30,
                  color: holidays[index].iconColor, // Set the icon color
                ),
                title: Text(
                  holidays[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat('dd MMMM yyyy').format(holidays[index].date)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      '${DateFormat('EEEE').format(holidays[index].date)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                // You can add more details to each holiday if needed
              ),
            ),
          );
        },
      ),
      // Bottom Navigation Bar
    //  bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
