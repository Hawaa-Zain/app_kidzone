import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/bostAdv_screens.dart';
import 'package:kidzone_app/Screens/chat_screens.dart';
import 'package:kidzone_app/Screens/nursery_screens.dart';
import 'package:kidzone_app/Screens/profile_screens.dart';


class HomeScreens extends StatefulWidget {
  @override
  _HomeScreens createState() => _HomeScreens();
}

class _HomeScreens extends State<HomeScreens> {
  int currentIndex= 0;
  final screens = [
    NurseryScereens(),
    BostAdvScreens(),
    ChatScreens(),
    ProfileScreens(),
  ];


  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: currentIndex,
      children:screens,
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple.shade300,
      selectedItemColor: Colors.white,
      unselectedItemColor:Colors.white30,
      iconSize: 20,
      //selectedFontSize: 25,
      //unselectedFontSize: 16,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index)=> setState(() =>currentIndex= index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.purple.shade300,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.post_add),
              label: 'Chat',
              backgroundColor: Colors.purple.shade300,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: Colors.purple.shade300,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
              label: ' Person',
              backgroundColor: Colors.purple.shade300,
            ),
          ],
        ),

      );
}
