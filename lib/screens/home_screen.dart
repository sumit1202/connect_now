import 'package:connect_now/resources/auth_methods.dart';
import 'package:connect_now/screens/history_meeting_screen.dart';
import 'package:connect_now/screens/meetings_screen.dart';
import 'package:connect_now/utils/colors.dart';
import 'package:connect_now/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;

  onPageChanged(int page) {
    _page = page;
    setState(() {});
  }

  List<Widget> pages = [
    MeetingsScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().logOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        //unselectedFontSize: 14.0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_outlined), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
