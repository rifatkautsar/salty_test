import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salty_test/features/Home/home_page.dart';
import 'package:salty_test/features/Settings/settings_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    return WillPopScope(
      onWillPop: () async {
        // Check if the back button is pressed again within 2 seconds
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) > const Duration(seconds: 2)) {
          currentBackPressTime = DateTime.now();
          // Show a message indicating to press again to exit
          Get.snackbar('Press again to exit', '', duration: const Duration(seconds: 2));
          return false; // Prevent exiting
        } else {
          return true; // Allow exiting
        }
      },
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
