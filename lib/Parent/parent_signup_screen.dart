import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidzone_app/Parent/parent_login_screen.dart';
import 'dart:io';


User user1 = FirebaseAuth.instance.currentUser;

class ParentSignUpScreen extends StatefulWidget {
  static const String screenRoute = 'signup_screen';
  @override
  State<StatefulWidget> createState() => InitState();
}
class InitState extends State<ParentSignUpScreen> {

  @override
  void initState() {
    super.initState();
  }


   String _name;
   String _email;
   String _phone;
   String _password;
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;

  // method for pick image
  void pickImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100, // from 0,100 .. to be more fast in stoarge and restore
      maxWidth: 1080,
    );
    setState(() {
      _image = File(image.path);
    });
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
  // check if the form validate then create it then upload it to Firestore
  void validateAndSubmit() async {
    if (validateAndSave()) {
      setState(() => loading = true);
      try {
        var result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        print(result);
        final ref = FirebaseStorage.instance
            .ref()
            .child('parent_images')
            .child(result.user.uid + '.jpg');
        await ref.putFile(_image);
        final url = await ref.getDownloadURL();

        //if (result != null) {
          FirebaseFirestore.instance.collection('Parent').doc(user1.uid).set({
            'name': _name,
            'role': 'Parent',
            'email': _email,
            "phone": _phone,
            'userID': user1.uid,
            'image_url': url,
        });

        Fluttertoast.showToast(
          msg: "تم انشاء الحساب بنجاح",
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 20.0,
        );
        var router = MaterialPageRoute(
            builder: (BuildContext context) => ParentLoginScreen());
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
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)),
                      color: new Color(0xFFFFFFFF),
                      gradient: LinearGradient(
                        colors: [(new Color(0xFFBBA68C8)),
                          new Color(0xFFBBA68C8)],
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
                  SizedBox(height: 10),
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: _image != null
                              ? FileImage(_image)
                              : AssetImage('') as ImageProvider,
                          // if statment
                        ),
                        Positioned(
                          bottom: -15,
                          right: -10,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              primary: Colors.purple[300],
                            ),
                            onPressed: pickImage,
                            icon: Icon(Icons.camera_alt_outlined,
                                size: 30),
                            label: Text('',style: TextStyle(
                              color: Colors.black54,
                              fontSize: 6,),
                            ),
                          ),
                        ),],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'الإسم مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _name = value;
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'البريد الالكتروني مطلوب';
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'رقم الجوال مطلوب';
                        } else if(value.length < 10) {
                          return "رقم الجوال يجب أن يتكون من 10 أرقام ";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _phone = value;
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        focusColor: Color(0xFFBBA68C8),
                        icon: Icon(
                          Icons.phone_android,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: "رقم الجوال",
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

                      validator: (String value) {

                        bool passValid = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')

                            .hasMatch(value);
                        if (value.isEmpty) {
                          return 'كلمة المرور  مطلوبة';
                        } else if(value.length < 8) {
                          return "كلمة المرور يجب ألا تقل عن 8 أرقام ";
                        }
                           else if(passValid) {
                           return "كلمة المرور يجب أن تحتوي على رموز مثل @ "
                               ".-_ ";
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        _password = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        focusColor: Color(0xFFBBA68C8),
                        icon: Icon(
                          Icons.lock_outline,
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
                                    builder: (context) => ParentLoginScreen(),)

                              );})],
                    ),
                  )],
              ),
            )
        )
    );
  }
}