// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/Parent_Tap_Track_Order.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';

User user = FirebaseAuth.instance.currentUser;

class CentersScreen extends StatefulWidget {
  @override
  CentersScreenState createState() => CentersScreenState();
}
String searchWord = '';
bool showTextField = false;

class CentersScreenState extends State<CentersScreen> {
  TextEditingController searchWordController = TextEditingController();

  Widget _buildFloatingSearchBtn() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          setState(() {
            showTextField = !showTextField;
          });
        },
      ),
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: Center(
        child: TextField(
          controller: searchWordController,
          cursorColor: const Color(0xFFBBA68C8),
          decoration: const InputDecoration(
            hintText: "البحث ",
            hintStyle: TextStyle(color:Colors.white),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (search) {
            setState(() {
              searchWord = search;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز الحضانة'),
        backgroundColor: Colors.purple[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0.0, 5.0, 0.0),
              child: SizedBox(
                width: showTextField ? 300 : 40,
                child: Row(
                  children: <Widget>[
                    showTextField ? _buildTextField() : Container(),
                    _buildFloatingSearchBtn(),
                  ],
                ),
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentTapTrackOrder(),
                  ));
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CentersGrid(
        searchWord: searchWord,
      ),
    );
  }
}






