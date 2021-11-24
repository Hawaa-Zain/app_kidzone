import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


User? user = FirebaseAuth.instance.currentUser;

class CentersScreen extends StatefulWidget {
  @override
  CentersScreenState createState() => CentersScreenState();
}

class CentersScreenState extends State<CentersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز الحضانة'),
        backgroundColor: Colors.purple[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ParentOrderTrackPage(),
                  ));
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CentersGrid(),
    );
  }
}


class  ParentOrderTrackPage extends StatefulWidget {
  const  ParentOrderTrackPage({Key? key}) : super(key: key);

  @override
  _ParentOrderTrackPage createState() => _ParentOrderTrackPage();
}

class _ParentOrderTrackPage extends State< ParentOrderTrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الحجوزات"),
        backgroundColor: Colors.purple[300],
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Parent")
        .doc(user!.uid)
        .collection("Children")
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
          itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
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
                child: Row(
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
                              Text("اسم الطفل", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,),),
                                SizedBox(width: 80),
                                Text(doc['name'], style: TextStyle(
                                  fontSize: 15,),),
                            ]
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.access_time_outlined,
                              color: Colors.purple.shade300,
                              size: 27,),
                            SizedBox(width: 15),
                            Text(" حالة الطلب",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,)),
                          ],),],
                    ),],
                ),
              ),
             ),
            );},
          );}
      ),
    );
  }
}

