import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidzone_app/Center/Screen/Center_Login.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/Parent/welcome_Screen.dart';

//User? user = FirebaseAuth.instance.currentUser;

class SignUpCenter extends StatefulWidget {
  static const String screenRoute = 'signup_center';
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpCenter> {
   String _name;
   String _email;
   String _phone;
   String _address;
   String _workingHours;
   String _kidsAge;
   String _price;
   String _password;
  bool loading = false;
   double _rating =0.0;
  File _image;

  // method for pick image
  void pickImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // from 0,100 .. to be more fast in storage and restore
      maxWidth: 150,
    );
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool validateAndSave() {
      final form = _formKey.currentState;
      if (form.validate()) {
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
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_image')
              .child(result.user.uid + '.jpg');
          await ref.putFile(_image);
          final url = await ref.getDownloadURL();

          //send an order to the admin and they can delete them
          FirebaseFirestore.instance.collection('Centers').doc(user.uid).set({
            "state": "NotActive",
            'state2': 'في الانتظار',
            'name': _name,
            "searchKey": '${_name[0]}',
            'role': 'Center',
            'email': _email,
            'phone':_phone,
            'price': _price,
            'address': _address,
            'kidsAge': _kidsAge,
            'workingHours': _workingHours,
            'image_url': url,
            "ratings" : _rating,
            'userID': user.uid,
          });

          //if (result != null) {

          Fluttertoast.showToast(
            msg: " تم ارسال الطلب بنجاح,انتظر الرد على طلبك",
            backgroundColor: Color(0xFFFFCC80),
            textColor: Colors.black,
            fontSize: 20.0,
          );
          var router = MaterialPageRoute(
              builder: (BuildContext context) => WelcomeScreen());
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
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)),
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
                              alignment: Alignment.center,
                              child: Text(
                                "إنشاء حساب جديد",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,),
                                ),
                            ),],
                        )
                    ),
                  ),
                  SizedBox(height: 20),
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
                          // if statement
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
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'اسم مركز الحضانة مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _name = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.group_outlined,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: "اسم مركز الحضانة  ",
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
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: "البريد الإلكتروني",
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
                          return 'الرقم  مطلوب';
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
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: " رقم للتواصل",
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
                          return 'الحي مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _address = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.location_on,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: "الحي  ",
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
                          return '  مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _workingHours = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.access_time,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: " ساعات العمل ",
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
                          return '  مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _kidsAge = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.child_friendly_outlined,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: " سن القبول  ",
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
                          return '  مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _price = value;
                      },
                      cursorColor: Color(0xFFBBA68C8),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.attach_money_outlined,
                          color: Color(0xFFBBA68C8),
                        ),
                        hintText: " الرسوم  ",
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
                        bool passValid = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value);
                        if (value.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        } else if(value.length < 8) {
                          return "كلمة المرور يجب ألا تقل عن 8 أرقام ";
                        }
                        else if(passValid) {
                          return "كلمة المرور يجب أن تحتوي على رموز مثل @ "
                              ".-_ ";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _password = value;
                      },
                      obscureText: true,
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
                        "ارسال الطلب",
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
                                    builder: (context) => LoginCenter(),)
                              );}
                        )],
                    ),
                  )],
              ),
            )
        )
    );
  }

  showDialogConfirmForm(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("إرسال"),
      onPressed:  () {

        },
    );
    Widget continueButton = TextButton(
      child: Text("الغاء"),
      onPressed:  () {
        Navigator.pop(context, MaterialPageRoute(builder: (_)=>
            SignUpCenter()
        ));

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(" هل أنت متأكد من صحة المعلومات",style: TextStyle(fontSize:
      20, color: Colors
          .purple[300]),
      ),
      content: Row(
        children: [
        Text(" سيتم إرسال الطلب ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
