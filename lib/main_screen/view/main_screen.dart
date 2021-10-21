import 'package:daily_productivity/calendar/view/calendar_screen.dart';
import 'package:daily_productivity/home/home.dart';
import 'package:daily_productivity/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Times.fast,
        child: [
          const HomePage(),
          const CalendarPage(),
          Container(),
          Container()
        ][selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.thLarge),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? const Icon(FontAwesomeIcons.solidCalendarAlt)
                : const Icon(FontAwesomeIcons.calendarAlt),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? const Icon(FontAwesomeIcons.solidStickyNote)
                : const Icon(FontAwesomeIcons.stickyNote),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? const Icon(FontAwesomeIcons.solidUser)
                : const Icon(FontAwesomeIcons.user),
            label: 'User',
          ),
        ],
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
