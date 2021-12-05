import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/welcome_Screen.dart';
import 'package:kidzone_app/resetpassword.dart';


class ParentProfileScreen extends StatefulWidget {
  const ParentProfileScreen({Key key}) : super(key: key);

  @override
  State<ParentProfileScreen> createState() => _ParentProfileScreen();
}

class _ParentProfileScreen extends State<ParentProfileScreen> {
   User _user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    // async and await important
    User userData = FirebaseAuth.instance.currentUser; // current user
    setState(() {
      _user = userData;
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
                SizedBox(height: 130),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.person_outlined,
                          color: Colors.purple[300],
                        ),
                        title: Text(snapshot.data['name']),

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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Colors.purple[300],
                        ),
                        title: Text(' تسجيل خروج  '),
                        onTap: () {
                          _onLogOutPressed(context);
                        },),]
                    )
                ),]
          );}
        );}
    ),
  );
}

void _onLogOutPressed(BuildContext context){
  showModalBottomSheet(
      context:context,
      builder: (context){
        return  Container(
            height: 300,
            color:Colors.white,
            child: Column(
              children: <Widget> [
                SizedBox(height: 10),
                Text("تسجيل الخروج",
                  style: TextStyle(color: Colors.purple[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),),
                SizedBox(height: 8),
                Text(" هل أنت متأكد أنك تريد تسجيل الخروج ؟",
                  style: TextStyle(color: Colors.purple[300],
                      fontSize: 15),),
                SizedBox(height: 13.5),
                GestureDetector(
                  onTap: () async {
                    // add then in SignOut..
                    await FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 100, right: 100,top: 30 ,bottom: 50),
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                    child: Text("نعم",
                      style: TextStyle(color: Colors.white, fontWeight:
                      FontWeight.bold, fontSize: 20),),
                  ),
                ),
                SizedBox(height: 0.5),
                Container(
                  margin: EdgeInsets.all(8),
                  child: TextButton(
                    child: Text('إلغاء الامر'),
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => ParentProfileScreen(),));
                      },
                  ),
                ),],
            )
        );
      });
}

class ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20, top: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "  تغيير كلمة المرور ",
                          style: TextStyle(fontSize: 30, color: Colors
                              .purple[300],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 80,),
                      Padding(
                          padding:EdgeInsets.all(15),
                          child: Column(children: [
                            Text("اعد إدخال البريد الإلكتروني الخاص بك للمتابعة",
                                style:TextStyle(fontSize: 15,
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
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: TextFormField(
                                cursorColor: Color(0xFFBBA68C8),
                                decoration: InputDecoration(
                                  hintText: "البريد الالكتروني ",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left:70,right:70, top: 50),
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
                                  "تحديث",
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 25),
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
                                      MaterialPageRoute(builder: (context) =>
                                          ParentProfileScreen(),)

                                  );},
                              ),
                            ),
                          ])
                      ),],
                  )
              ),],
          ),
        )
    );
  }
}
