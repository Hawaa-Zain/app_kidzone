import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/Parent_See_Advertisement_Screen.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/Parent/parent_chat_screen.dart';
import 'package:kidzone_app/Parent/Parent_profile_screen.dart';


class ParentTabsScreen extends StatefulWidget {
  @override
  _ParentTabsScreen createState() => _ParentTabsScreen();
}

class _ParentTabsScreen extends State<ParentTabsScreen> {
  int currentIndex = 0;
  final screens = [
   CentersScreen(),
    ParentSeeAdvertisement(),
    ParentChatScreen(),
    ParentProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: currentIndex,
      children: screens,
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple.shade300,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
      iconSize: 20,
      //selectedFontSize: 25,
      //unselectedFontSize: 16,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'مراكز الحضانة ',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add),
          label: 'إعلاناتي',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'محادثاتي',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ' حسابي',
          backgroundColor: Colors.purple.shade300,),],
    ),
  );
}
