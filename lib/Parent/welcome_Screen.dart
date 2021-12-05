import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Login_admin.dart';
import 'package:kidzone_app/Center/Screen/Center_Login.dart';
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
                           );},
                         child: ClipRRect(
                           child: Image.asset(
                             "assets/images/kidzoneLogo0.png",
                             height: 250,
                             width: 300,),
                         ),
                       )
                   ),],
               ),
              ),
            ),
            SizedBox(height: 150,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      child: Text("مركز حضانة"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                        onPrimary: Colors.white,
                        primary: Colors.purple[300],
                        onSurface: Colors.grey,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius:
                        BorderRadius.circular(40)),
                      ),
                      onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginCenter()),
                        );},),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          child: Text(" ولي أمر"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 20,
                                horizontal: 130),
                            onPrimary: Colors.white,
                            primary: Colors.purple[300],
                            onSurface: Colors.grey,
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius:
                            BorderRadius.circular(40)),
                          ),
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ParentLoginScreen()),
                            );},),

                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    LoginAdmin()));
                      },
                      child: Text("دخول الادمن", style: TextStyle(
                        color: Colors.black38,
                      ),),
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
