import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/login_center.dart';
import 'package:kidzone_app/Parent/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xFFFFFFFF),
                gradient: LinearGradient(
                  colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/kidzone.png",
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
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
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 95),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
