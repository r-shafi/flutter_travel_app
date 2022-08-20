import 'package:flutter/material.dart';
import 'package:travel_app/pages/bar_item_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/profile_page.dart';
import 'package:travel_app/pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    ProfilePage()
  ];

  int currentIndex = 0;

  void _handleNavigation(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: _handleNavigation,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: 'Bar',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
