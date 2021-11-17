import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/kids%20_Register%20_Order.dart';
import 'package:kidzone_app/Center/Screen/Center_Post_Advertisement_Screen.dart';
import 'package:kidzone_app/Center/Screen/Center_chat_Screen.dart';
import 'package:kidzone_app/Center/Screen/Center_profile_screen.dart';

class CentersTapsScreens extends StatefulWidget {
  @override
  _CentersTapsScreens createState() => _CentersTapsScreens();
}

class _CentersTapsScreens extends State<CentersTapsScreens> {
  int currentIndex = 0;
  final screens = [
    KidsRegisterOrder(),
    CenterPostAdvertisementScreens(),
    CenterChatScreens(),
    CenterProfileScreens(),
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
              label: 'اعلاناتي',
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
              backgroundColor: Colors.purple.shade300,),],
        ),
  );
}
