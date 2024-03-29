import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';
import 'package:kidzone_app/Parent/Parent_Order_Track.dart';
import 'package:kidzone_app/Parent/welcome_Screen.dart';
import 'package:kidzone_app/resetpassword.dart';

class CenterProfileScreens extends StatefulWidget {
  const CenterProfileScreens({Key key}) : super(key: key);

  @override
  State<CenterProfileScreens> createState() => _CenterProfileScreens();
}

class _CenterProfileScreens extends State<CenterProfileScreens> {
  User _user;
  File _image;
  bool imageUpdateRequired = false;


  @override
  void initState() {
    getUserData();
    super.initState();
  }

  // method for pick image
  void pickImage() async {
    var image = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 50, // from 0,100 .. to be more fast in stoarge and restore
      maxWidth: 150,
    );
    setState(() {
      _image = File(image.path);
      updateImageData();
    });
  }

  void updateImageData() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(_user.uid + '.jpg');
    await ref.putFile(_image);
    final url = await ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('Centers')
        .doc(user.uid)
        .update({'image_url': url});
    //Navigator.pop(context);
  }

  getUserData() async {
    // async and await important
    User userData = FirebaseAuth.instance.currentUser; // current user
    setState(() {
      _user = userData;
      print(userData.uid);
      print(userData.email);
      print(userData.phoneNumber);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(' حسابي '),
      backgroundColor: Colors.purple[300],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CentersBottomTapsScreens()
          ));

        },
      ),
    ),
    body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Centers")
            .doc(_user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount:1, //snapshot.data.docs
              // .length,
              itemBuilder: (context, index) {
                final _userDoc = snapshot.data;

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      SizedBox(height: 130,width: 130,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              radius: 200,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: _image != null ? FileImage(_image) : null,
                              child: ClipOval(
                                child: SizedBox(
                                  width: 188.0,
                                  height: 188.0,
                                  child: Image.network(
                                    _userDoc['image_url'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(bottom: -5,
                              right: -10,
                              child: TextButton.icon(
                                style: TextButton.styleFrom(
                                  primary: Colors.purple[300],),
                                onPressed: (){
                                  setState(() {
                                    imageUpdateRequired = true;
                                    pickImage();
                                  });
                                },
                                icon: Icon(Icons.edit,
                                    size: 30),
                                label: Text('',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 6,),),
                              ),
                            ),],
                        ),
                      ),
                      SizedBox(height:30),
                      Card(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 5, top: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.person_outlined,
                              color: Colors.purple[300],),
                            title: Text(snapshot.data['name']),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.email_outlined,
                              color: Colors.purple[300],
                            ),
                            title: Text(snapshot.data['email']),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.purple[300],),
                            title: Text(snapshot.data['phone']),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.lock_outline,
                              color: Colors.purple[300],),
                            title: Text('تغيير كلمة المرور'),
                            trailing: Icon(Icons.keyboard_arrow_left),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ResetPasswordScreen(),),);},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout_outlined,
                              color: Colors.purple[300],
                            ),
                            title: Text(' تسجيل خروج  '),
                            onTap: () {
                              _onLogOutpressed(context);},
                          ),]
                        ),
                      )]);
              });
        }),
  );
}

void _onLogOutpressed(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
            child:Container(
                height: 300,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                          color: Colors.purple[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(height: 15),
                    Text(
                      " هل أنت متأكد أنك تريد تسجيل الخروج ؟",
                      style: TextStyle(color: Colors.purple[300], fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        // add then in signout..
                        await FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()));
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 100, right: 100, top: 5),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                (new Color(0xFFBBA68C8)),
                                new Color(0xFFBBA68C8)
                              ],
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
                          "نعم",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextButton(
                        child: Text('إلغاء الامر'),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CenterProfileScreens(),
                              ));
                        },
                      ),
                    ),],
                )
            )
        );
      });
}

class ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 50),
                        alignment: Alignment.center,
                        child: Text("  تغيير كلمة المرور ",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 80,),
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                              children: [
                                Text("اعد إدخال البريد الإلكتروني الخاص بك للمتابعة",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.purple[300],
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey[200],
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color: Color(0xffEEEEEE)),],
                                  ),
                                  child: TextFormField(
                                    cursorColor: Color(0xFFBBA68C8),
                                    decoration: InputDecoration(
                                      hintText: "البريد الالكتروني ",
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,),),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 70, right: 70, top: 50),
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    height: 54,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            (new Color(0xFFBBA68C8)),
                                            new Color(0xFFBBA68C8)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 50,
                                            color: Color(0xffEEEEEE)),],),
                                    child: Text("تحديث",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: TextButton(
                                    child: Text('إلغاء الامر'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CenterProfileScreens(),)

                                      );},),
                                ),]
                          )
                      ),],
                  )
              ),],
          ),
        )
    );
  }

}