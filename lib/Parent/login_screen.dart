import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidzone_app/Parent/signup_screen.dart';
import 'package:kidzone_app/Parent/tab_screen.dart';


import 'centers_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {

  late String? _email;
  late String? _password;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  late String _error;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    Future<String?> canLogin(String email) async {
      String? role;

      await FirebaseFirestore.instance
          .collection('Parent')
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) => role = doc['role']);
        print('$role inside canlog function');
      });
      return role;
    }


    bool validateAndSave() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        // التحقق من الفورم
        form.save();
        return true;
      }
      return false;
    }

    void validateAndSubmit() async {
      if (validateAndSave()) {
        setState(() => loading = true);
        dynamic role = await canLogin(_email!);
        print('$role inside onpress function');
        if (role == 'Parent') {
          try {
            await auth.signInWithEmailAndPassword(
                email: _email!, password: _password!);

            //if (result.credential!.signInMethod.isNotEmpty) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TabsScreen()));
            // var router = MaterialPageRoute(
            //     builder: (BuildContext context) => ProfileScreen());
            // Navigator.of(context).push(router);
            // } else {
            //   setState(() => loading = false);
            //   print('user not found');
            // }
          } catch (e) {
            print('Error: $e');
            setState(() {
              _error = e.toString();
            });
            Fluttertoast.showToast(
              msg: "كلمة المرور غير صحيحة",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20.0,
            );
            setState(() => loading = false);
          }
        } else {
          setState(() => loading = false);
          print('This user is not a Parent');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );

          Fluttertoast.showToast(
            msg: "الايميل غير تابع للاهالي",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 20.0,
          );
        }
      }
    }
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "تسجيل دخول",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'البريد الإلكتروني مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _email = value!;
                      },
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
                      obscureText: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'الرقم السري مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _password = value!;
                      },
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here
                      },
                      child: Text("هل نسيت كلمة المرور؟"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      validateAndSubmit();
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لديك حساب؟ "),
                        GestureDetector(
                          child: Text(
                            "سجل الان",
                            style: TextStyle(color: Color(0xFFBBA68C8)),
                          ),
                          onTap: () {
                            // Write Tap Code Here.
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}