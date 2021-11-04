import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Home_Admin.dart';

class LoginAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginAdmin();
}

class _LoginAdmin extends State<LoginAdmin> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
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
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "تسجيل دخول",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),)
              ],
            )),
      ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 130),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              cursorColor: Color(0xFFBBA68C8),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Color(0xFFBBA68C8),
                ),
                hintText: "البريد الالكتروني ",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              cursorColor: Color(0xFFBBA68C8),
              decoration: InputDecoration(
                focusColor: Color(0xFFBBA68C8),
                icon: Icon(
                  Icons.vpn_key,
                  color: Color(0xFFBBA68C8),
                ),
                hintText: "كلمة المرور ",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeAdmin()),
              );
              // Write Click Listener Code Here.
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                "دخول",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),


        ])));
  }
}