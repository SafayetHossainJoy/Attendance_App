import 'package:hrms/Expense/DashBoard/expense_dashboard.dart';
import 'package:hrms/Holidays/allholidays.dart';
import 'package:hrms/Homepage.dart';
import 'package:hrms/Leaves/all_leave.dart';
import 'package:hrms/checkInOut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Bottomnavi extends StatelessWidget {
  const Bottomnavi({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            controller.selectedDestination.value = index;
          },
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24,
                height: 24,
                color: controller.selectedDestination.value == 0 ? Colors.blue : Colors.grey,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/leave.png',
                width: 24,
                height: 24,
                color: controller.selectedDestination.value == 1 ? Colors.blue : Colors.grey,
              ),
              label: "All Leave",
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/holidays.png',
                width: 24,
                height: 24,
                color: controller.selectedDestination.value == 2 ? Colors.blue : Colors.grey,
              ),
              label: "Holidays",
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/expense.png',
                width: 24,
                height: 24,
                color: controller.selectedDestination.value == 3 ? Colors.blue : Colors.grey,
              ),
              label: "Expense",
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/user.png',
                width: 24,
                height: 24,
                color: controller.selectedDestination.value == 4 ? Colors.blue : Colors.grey,
              ),
              label: "My Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Rx<int> selectedDestination = 0.obs; // Track selected destination

  final screens = [
    HomePage(),
    LeavePage(),
    HolidaysListPage(),
    ExpenseDashboard(),
    CheckInOutListPage(),
  ];
}
