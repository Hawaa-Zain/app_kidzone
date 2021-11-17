import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/parent_login_screen.dart';


class ParentProfileScreen extends StatefulWidget {
  const ParentProfileScreen({Key? key}) : super(key: key);

  @override
  State<ParentProfileScreen> createState() => _ParentProfileScreen();
}

class _ParentProfileScreen extends State<ParentProfileScreen> {
  late User _user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    // async and await important
    User? userData = FirebaseAuth.instance.currentUser; // current user
    setState(() {
      _user = userData!;
      print(userData.uid);
      print(userData.email);
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(' حسابي '),
      backgroundColor: Colors.purple[300],
    ),
    body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Parent")
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
        itemCount: 1, //snapshot.data.docs.length,
        itemBuilder: (context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.person_outlined,
                          color: Colors.purple[300],
                        ),
                        title: Text(snapshot.data!['name']),

                      ),
                      ListTile(
                        leading: Icon(
                          Icons.email_outlined,
                          color: Colors.purple[300],
                        ),
                        title: Text(snapshot.data!['email']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.purple[300],
                        ),
                        title: Text(' رقم الجوال'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.purple[300],
                        ),
                        title: Text('تغيير كلمة المرور'),
                        trailing: Icon(Icons.keyboard_arrow_left),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Colors.purple[300],
                        ),
                        title: Text(' تسجيل خروج  '),
                        onTap: () {
                          showLogoutDialog(context);
                        },),]
                    )
                ),]
          );}
        );}
    ),
  );
}

showLogoutDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("نعم "),
    onPressed:  () async {
      // add then in signout..
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ParentLoginScreen()));
      });
    },
  );
  Widget continueButton = TextButton(
    child: Text(" الغاء الامر"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("تسجيل خروج"),
    content: Text(" هل انت متأكد انك تريد تسجيل الخروج؟" ),

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
