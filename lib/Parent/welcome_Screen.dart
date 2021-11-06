import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Login_admin.dart';
import 'package:kidzone_app/Center/Screen/login_center.dart';
import 'package:kidzone_app/Parent/parent_login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 100),
                        child:InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginAdmin()),
                            );
                          },
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/images/kidzoneLogo0.png",
                              height: 250,
                              width: 300,

                            ),
                          ),)),
                  ],
                ),
              ),

            ),
            SizedBox(height: 150,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginCenter()),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal:120),
                    color: Colors.purple.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Text(
                      'مركز الحضانة',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParentLoginScreen()),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 130),
                          color: Colors.purple.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Text(
                            'ولي الأمر',
                            style: TextStyle(
                              color: Colors.white,

                            ),
                          ),
                          ),
                      ],
                    ),
                  ),

                ],
              ),
            ),],
        ),
      ),
    );
  }
}
