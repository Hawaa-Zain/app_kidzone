import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidzone_app/Center/Screen/login_center.dart';
import 'package:kidzone_app/Parent/login_screen.dart';

class SignUpCenter extends StatefulWidget {
  static const String screenRoute = 'signup_center';
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpCenter> {
  late String _name;
  late String _email;
  late String _password;
  bool loading = false;

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    User? user = FirebaseAuth.instance.currentUser;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool validateAndSave() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        // التحقق من الفورم
        form.save();
        return true;
      }
      return false;
    }

    // check if the form validate then create it then upload it to firestore
    void validateAndSubmit() async {
      if (validateAndSave()) {
        setState(() => loading = true);
        try {
          var result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _email, password: _password);

          //if (result != null) {
            FirebaseFirestore.instance.collection('Centers').doc(user!.uid).set({
              'name': _name,
              'role': 'Center',
              'email': _email,
              'userID': user.uid,
            });
            Fluttertoast.showToast(
              msg: "تم التسجيل بنجاح",
              backgroundColor: Color(0xFFFFCC80),
              textColor: Colors.black,
              fontSize: 20.0,
            );
            var router = MaterialPageRoute(
                builder: (BuildContext context) => LoginCenter());
            Navigator.of(context).push(router);
          //} else {
          //   setState(() => loading = false);
          //   print('user not found');
          // }
        } catch (e) {
          print('Error: $e');
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
                    "إنشاء حساب جديد",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                  return 'الإسم مطلوب';
                }
                return null;
              },
              onSaved: (String? value) {
                _name = value!;
              },
              cursorColor: Color(0xFFBBA68C8),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFFBBA68C8),
                ),
                hintText: "الاسم الكامل ",
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
                hintText: "البريد الالكتروني",
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
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'الرقم السري مطلوب';
                }
                return null;
              },
              onSaved: (String? value) {
                _password = value!;
              },
              obscureText: true,
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
                "تسجيل",
                style: TextStyle(color: Colors.white),
              ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("لديك حساب ؟  "),
                GestureDetector(
                    child: Text(
                      " تسجيل دخول",
                      style: TextStyle(color: Color(0xFFBBA68C8)),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginCenter(),
                          ));
                    })
              ],
          ),
        )
      ],
    ),
            )));
  }
}
