import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notecraft/common/bottom_nav/bottom_icon.dart';
import 'package:notecraft/screens/home/bottom_tabs/colab_screen.dart';
import 'package:notecraft/screens/home/bottom_tabs/history_screen.dart';
import 'package:notecraft/screens/home/bottom_tabs/home_screen.dart';
import 'package:notecraft/screens/home/bottom_tabs/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ColabScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            context.push("/edit_note");
          },
          backgroundColor: const Color.fromARGB(209, 25, 25, 25),
          foregroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomItem(
              title: "Home",
              icon: FontAwesomeIcons.house,
              isSelected: _currentIndex == 0,
              callback: () {
                updateIndex(0);
              },
            ),
            BottomItem(
              title: "Team",
              icon: FontAwesomeIcons.users,
              isSelected: _currentIndex == 1,
              callback: () {
                updateIndex(1);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: BottomItem(
                title: "History",
                icon: FontAwesomeIcons.clockRotateLeft,
                isSelected: _currentIndex == 2,
                callback: () {
                  updateIndex(2);
                },
              ),
            ),
            BottomItem(
              title: "Profile",
              icon: FontAwesomeIcons.idBadge,
              isSelected: _currentIndex == 3,
              callback: () {
                updateIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
