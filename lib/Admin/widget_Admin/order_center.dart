import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Center_order_details.dart';


class OrderCenter extends StatefulWidget {
  @override
  State<OrderCenter> createState() => _OrderCenter();
}
class _OrderCenter extends State<OrderCenter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Centers")
          .where("state", isEqualTo: "NotActive")
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
            shrinkWrap: true,
            itemBuilder:(
                BuildContext context, int index) {
              final doc = snapshot.data.docs[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.teal.shade100,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Icon(Icons.group_outlined,
                                    color: Colors.teal.shade300,
                                    size: 30,),
                                  SizedBox(width: 5),
                                  Text(doc['name'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,),),
                                ],
                              ),
                              SizedBox(height: 40),
                              Row(
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Icon(Icons.access_time_outlined,
                                    color: Colors.teal.shade300, size: 30,),
                                  SizedBox(width: 5),
                                  Text(doc['state2'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,),),
                                  SizedBox(width: 80),
                                  Text('',
                                    style: TextStyle(
                                      fontSize: 15,),),
                                ],
                              ),
                            ]
                        ),
                        SizedBox(width: 8),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8,),
                                child: ElevatedButton(
                                  child: Text("عرض الطلب "),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric
                                      (vertical: 5, horizontal: 5),
                                    onPrimary: Colors.white,
                                    primary: Colors.teal.shade300,
                                    onSurface: Colors.grey,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5)),),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          CenterOrderDetails(cendoc: doc,)),);
                                  },

                                ),
                              )
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
              );
    }
             );
        }
      ),
    );
  }
}