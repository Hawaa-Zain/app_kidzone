import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Home_Admin.dart';
import 'package:kidzone_app/Parent/welcome_Screen.dart';

class LoginAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginAdmin();
}

class _LoginAdmin extends State<LoginAdmin> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String _error;
  FirebaseAuth auth = FirebaseAuth.instance;


    Future<String> canLogin(String email) async {
      String role;

      await FirebaseFirestore.instance
          .collection('Admin')
      //.where('userID', isEqualTo: u)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) => role = doc['role']);
        print('$role inside canlog function');
      });
      return role;
    }


    bool validateAndSave() {
      final form = _formKey.currentState;
      if (form.validate()) {
        // التحقق من الفورم
        form.save();
        return true;
      }
      return false;
    }

    void validateAndSubmit() async {
      if (validateAndSave()) {
        setState(() => loading = true);
        dynamic role = await canLogin(_email);
        print('$role inside onpress function');
        if (role == 'admin') {
          try {
            await auth.signInWithEmailAndPassword(
                email: _email, password: _password);

            //if (result.credential!.signInMethod.isNotEmpty) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeAdmin()));
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
          print('This user is not a Center');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );

          Fluttertoast.showToast(
            msg: "البريد الإلكتروني غير تابع للادمن",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 20.0,
          );
        }
      }
    }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                color: new Color(0xFFFFFFFF),
                gradient: LinearGradient(
                  colors: [(new Color(0xFF4DB6AC)), new Color(0xFF4DB6AC)],
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
                    alignment: Alignment.center,
                    child: Text(
                      " تسجيل دخول ",
                      style: TextStyle(fontSize: 20, color: Colors.white),),
                  )],
              )
             ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 130),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'البريد الإلكتروني مطلوب';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _email = value;
                },
                cursorColor: Color(0xFFBBA68C8),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xFF4DB6AC),
                  ),
                  hintText: "البريد الالكتروني ",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],),
              child: TextFormField(
                obscureText: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return ' كلمة المرور مطلوبة';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _password = value;
                },
                cursorColor: Color(0xFFBBA68C8),
                decoration: InputDecoration(
                  focusColor: Color(0xFFBBA68C8),
                  icon: Icon(
                    Icons.lock_outline,
                    color: Color(0xFF4DB6AC),
                  ),
                  hintText: "كلمة المرور ",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,),
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
                      colors: [(new Color(0xFF4DB6AC)), new Color(0xFF4DB6AC)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],),
                child: Text(
                  "دخول",
                  style: TextStyle(color: Colors.white),

                ),
              ),
            ),]
        ),
      ))
    );
  }
}