import 'package:droidcon_app/assets/images.dart';
import 'package:droidcon_app/home_page.dart';
import 'package:droidcon_app/user_interfaces/dashboard/home/home_screen.dart';
import 'package:droidcon_app/user_interfaces/dashboard/home/logged_in_home_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  final bool isLoggedIn;
  IndexScreen({this.isLoggedIn = false});
  @override
  State<IndexScreen> createState() => _IndexScreenState();
  static const routeName = '/index';
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  void initState() {
    if (widget.isLoggedIn) {
      _screens.first = LoggedInHomeScreen();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled), label: 'Sessions'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetImages.aboutIcon)),
                label: 'About'),
          ]),
    );
  }
}
