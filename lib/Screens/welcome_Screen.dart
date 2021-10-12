import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: new Color(0xFFFFFFFF),
                    gradient: LinearGradient(
                      colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                      child: Column(

                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Image.asset(
                                "assets/images/logo.png",
                                height: 90,
                                width: 90,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 20, right: 20, top: 300),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: 54,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: Text(
                                "مركز الحضانة",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                                SizedBox(height: 25,),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 3),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 54,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey[200],
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color: Color(0xffEEEEEE)),
                                    ],
                                  ),
                                  child: Text(
                                    "ولي الأمر",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
              ),
                ],
              ),
        ),


    );
  }
}