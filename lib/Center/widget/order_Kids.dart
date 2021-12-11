import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/kid_details.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';

class OrderKids extends StatefulWidget {
  @override
  State<OrderKids> createState() => _OrderKidsState();
}
class _OrderKidsState extends State<OrderKids> {
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Centers")
              .doc(user.uid)
              .collection("Registration")
          .where('checkReg',isEqualTo: "في الانتظار")
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
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final doc = snapshot.data.docs[index];
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Card(
                      elevation: 5.0,
                      color: Colors.purple.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                                      Text(doc['name'], style: TextStyle(
                                        fontSize: 17,),),
                                    ]
                                ),
                                SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.account_balance,
                                      color: Colors.purple.shade300,
                                      size: 27,),
                                    SizedBox(width: 15),
                                    Text(doc['centerName'], style: TextStyle(
                                      fontSize: 17,),),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(width: 5),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10,
                                    ),
                                    child: ElevatedButton(
                                        child: Text("تفاصيل الطفل"),
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: Colors.white,
                                          primary: Colors.purple[300],
                                          onSurface: Colors.grey,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                        onPressed: () {
                                          {
                                            Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      KidDetails(doc)),
                                            );
                                          }
                                        }
                                    ),
                                  ),
                                  ButtonBar(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ElevatedButton(
                                        child: Text("قبول "),
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: Colors.black,
                                          primary: Colors.greenAccent[700],
                                          onSurface: Colors.grey[700],
                                          elevation: 3,
                                          padding: EdgeInsets.all(2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                        onPressed: isButtonActive ? () async {
                                          print('check ${doc['checkReg']}');
                                          if (doc['checkReg'] == 'في الانتظار') {
                                            await FirebaseFirestore.instance
                                                .collection("Centers")
                                                .doc(user.uid)
                                                .collection("Registration").doc(
                                                doc['childID']).update(
                                                {
                                                  'checkReg': 'مقبول',
                                                });
                                            FirebaseFirestore.instance.collection("Parent").doc(doc['parentID'])
                                                .collection("Children").doc(doc['childID']).update({
                                              'checkReg': 'مقبول',
                                            });
                                            print('check ${doc['checkReg']}');
                                          } else {
                                            print('Somthing wrong');
                                          }
                                          setState(() {
                                            isButtonActive = false;
                                          });
                                        } : null,
                                      ),
                                      SizedBox(width: 5,),
                                      ElevatedButton(
                                        child: Text("رفض "),
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: Colors.black,
                                          primary: Colors.red[400],
                                          onSurface: Colors.grey[600],
                                          elevation: 3,
                                          padding: EdgeInsets.all(2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                        onPressed: isButtonActive ? () {
                                          if (doc['checkReg'] == 'في الانتظار')
                                            FirebaseFirestore.instance
                                                .collection("Centers")
                                                .doc(user.uid)
                                                .collection("Registration").doc(
                                                doc['childID']).update(
                                                {
                                                  'checkReg': 'مرفوض',
                                                });
                                          FirebaseFirestore.instance.collection("Parent").doc(doc['parentID'])
                                              .collection("Children").doc(doc['childID']).update({
                                            'checkReg': 'مرفوض',
                                          });

                                          print(doc['checkReg']);
                                          setState(() {
                                            isButtonActive = false;
                                          });
                                        } : null,
                                      ),
                                    ],
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  );}
            );}
      )
    );
  }
}

class OrderAcceptedKids extends StatefulWidget {
  @override
  State<OrderAcceptedKids> createState() => _OrderAcceptedKidsState();
}
class _OrderAcceptedKidsState extends State<OrderAcceptedKids> {
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Centers")
                .doc(user.uid)
                .collection("Registration")
                .where('checkReg',isEqualTo: 'مقبول')
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
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final doc = snapshot.data.docs[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Card(
                        elevation: 5.0,
                        color: Colors.purple.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                                        Text(doc['name'], style: TextStyle(
                                          fontSize: 17,),),
                                      ]
                                  ),
                                  SizedBox(height: 40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.account_balance,
                                        color: Colors.purple.shade300,
                                        size: 27,),
                                      SizedBox(width: 15),
                                      Text(doc['centerName'], style: TextStyle(
                                        fontSize: 17,),),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10,
                                      ),
                                      child: ElevatedButton(
                                          child: Text("تفاصيل الطفل"),
                                          style: ElevatedButton.styleFrom(
                                            onPrimary: Colors.white,
                                            primary: Colors.purple[300],
                                            onSurface: Colors.grey,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          ),
                                          onPressed: () {
                                            {
                                              Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KidDetails(doc)),
                                              );
                                            }
                                          }
                                      ),
                                    ),
                                    Text(doc['checkReg']),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      ),
                    );}
              );}
        )
    );
  }
}

class OrderRejectedKids extends StatefulWidget {
  @override
  State<OrderRejectedKids> createState() => _OrderRejectedKidsState();
}
class _OrderRejectedKidsState extends State<OrderRejectedKids> {
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Centers")
                .doc(user.uid)
                .collection("Registration")
                .where('checkReg',isEqualTo: 'مرفوض')
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
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final doc = snapshot.data.docs[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Card(
                        elevation: 5.0,
                        color: Colors.purple.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                                        Text(doc['name'], style: TextStyle(
                                          fontSize: 17,),),
                                      ]
                                  ),
                                  SizedBox(height: 40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.account_balance,
                                        color: Colors.purple.shade300,
                                        size: 27,),
                                      SizedBox(width: 15),
                                      Text(doc['centerName'], style: TextStyle(
                                        fontSize: 17,),),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10,
                                      ),
                                      child: ElevatedButton(
                                          child: Text("تفاصيل الطفل"),
                                          style: ElevatedButton.styleFrom(
                                            onPrimary: Colors.white,
                                            primary: Colors.purple[300],
                                            onSurface: Colors.grey,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                          ),
                                          onPressed: () {
                                            {
                                              Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KidDetails(doc)),
                                              );
                                            }
                                          }
                                      ),
                                    ),
                                    Text(doc['checkReg']),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      ),
                    );}
              );}
        )
    );
  }
}