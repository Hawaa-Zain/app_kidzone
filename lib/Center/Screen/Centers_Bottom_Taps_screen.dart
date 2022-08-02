import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Center_comments.dart';
import 'package:kidzone_app/Center/Screen/chatrooms.dart';
import 'package:kidzone_app/Center/Screen/kids%20_Register%20_Order.dart';
import 'package:kidzone_app/Center/Screen/Center_Post_Advertisement_Screen.dart';
import 'package:kidzone_app/Center/Screen/Center_profile_screen.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';

class CentersBottomTapsScreens extends StatefulWidget {
  @override
  _CentersBottomTapsScreens createState() => _CentersBottomTapsScreens();
}

class _CentersBottomTapsScreens extends State<CentersBottomTapsScreens> {
  int currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState()   {
    super.initState();
    getList();
  }

  getList () async {
    list = await getUserName();
  }



  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: list,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple.shade300,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          iconSize: 20,
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
              icon: Icon(Icons.comment),
              label: 'التعليقات',
              backgroundColor: Colors.purple.shade300,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ' حسابي',
              backgroundColor: Colors.purple.shade300,),],
        ),
  );
  Future<List<Widget>> getUserName()  async {
    String userName;
    //User currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('Centers')
        .where('userID', isEqualTo: user.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        userName = doc['name'];
        print('this is the center nammmme:$userName');
      });
    });
    final screens = [
      KidsRegisterOrder(),
      CenterPostAdvertisementScreens(),
      ChatRoom(userName: userName,),
      CenterComments(),
      CenterProfileScreens(),
    ];
    return screens;
  }
}



