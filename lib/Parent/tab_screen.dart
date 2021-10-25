import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/adve_Screen.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/Parent/chat_screen.dart';
import 'package:kidzone_app/Parent/profile_screen.dart';


class TabScreen extends StatefulWidget {
  @override
  _TabScreen createState() => _TabScreen();
}

class _TabScreen extends State<TabScreen> {
  int currentIndex = 0;
  final screens = [
   CentersScreen(),
    AdveScreen(),
    ChatScreen(),
    ProfileScreen(),
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
          label: 'طلبات التسجيل',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add),
          label: 'نشر اعلان',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'المحادثة',
          backgroundColor: Colors.purple.shade300,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ' حسابي',
          backgroundColor: Colors.purple.shade300,
        ),
      ],
    ),
  );
}
