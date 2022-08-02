import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


User user = FirebaseAuth.instance.currentUser;

class  ParentOrderTrackPage extends StatefulWidget {
  const  ParentOrderTrackPage({Key key}) : super(key: key);

  @override
  _ParentOrderTrackPage createState() => _ParentOrderTrackPage();
}
class _ParentOrderTrackPage extends State< ParentOrderTrackPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Parent")
            .doc(user.uid)
            .collection("Children")
        .where('checkReg', isEqualTo: 'في الانتظار')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            print(snapshot.data);
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data.docs[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.purple.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                                children: <Widget>[
                                  Icon(Icons.group_outlined,
                                    color: Colors.purple.shade300,
                                    size: 30,),
                                  SizedBox(width: 15),
                                  Text("اسم الطفل :", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,),),
                                  SizedBox(width: 30),
                                  Text(doc['name'], style: TextStyle(
                                    fontSize: 15,),),
                                ]
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Text("اسم مركز الحضانة:",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,)),
                                SizedBox(width: 30),
                                Text(doc['centerName'], style: TextStyle(
                                  fontSize: 15,),),
                              ],),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time_outlined,
                                  color: Colors.purple.shade300,
                                  size: 27,),
                                SizedBox(width: 5),
                                Text(" حالة الطلب",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,)),
                                SizedBox(width: 30),
                                Text(doc['checkReg'], style: TextStyle(
                                  fontSize: 15,),),
                              ],),],
                        ),],
                    ),
                  ),
                ),
              );},
          );}
    );
  }
}
class  ParentOldOrderPage extends StatefulWidget {
  const  ParentOldOrderPage({Key key}) : super(key: key);

  @override
  _ParentOldOrderPage createState() => _ParentOldOrderPage();
}

class _ParentOldOrderPage extends State< ParentOldOrderPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Parent")
            .doc(user.uid)
            .collection("Children")
            .where('checkReg', isNotEqualTo: 'في الانتظار')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            print(snapshot.data);
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data.docs[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.purple.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                                children: <Widget>[
                                  Icon(Icons.group_outlined,
                                    color: Colors.purple.shade300,
                                    size: 30,),
                                  SizedBox(width: 15),
                                  Text("اسم الطفل :", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,),),
                                  SizedBox(width: 30),
                                  Text(doc['name'], style: TextStyle(
                                    fontSize: 15,),),
                                ]
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Text("اسم مركز الحضانة:",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,)),
                                SizedBox(width: 30),
                                Text(doc['centerName'], style: TextStyle(
                                  fontSize: 15,),),
                              ],),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time_outlined,
                                  color: Colors.purple.shade300,
                                  size: 27,),
                                SizedBox(width: 5),
                                Text(" حالة الطلب",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,)),
                                SizedBox(width: 30),
                                Text(doc['checkReg'], style: TextStyle(
                                  fontSize: 15,),),
                              ],),],
                        ),],
                    ),
                  ),
                ),
              );},
          );}
    );
  }
}