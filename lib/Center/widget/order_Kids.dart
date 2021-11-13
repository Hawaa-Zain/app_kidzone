import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Center_Signup.dart';
import 'package:kidzone_app/Center/Screen/kid_details.dart';

class OrderKids extends StatefulWidget {
  @override
  State<OrderKids> createState() => _OrderKidsState();
}
class _OrderKidsState extends State<OrderKids> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Centers")
              .doc(user!.uid)
          .collection("Registration")
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
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (
                  BuildContext context, int index) {
                final doc = snapshot.data!.docs[index];
                return Container(
                   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                                       Text(doc['name']),
                                       ]
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.account_balance,
                                       color: Colors.purple.shade300,
                                       size: 27,),
                                     SizedBox(width: 15),
                                     Text(doc['centerName']),
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
                                     child: RaisedButton(
                                       onPressed: (){
                                         Navigator.push(context,
                                           MaterialPageRoute(builder: (context) => KidDetails(doc)),
                                         );}, color: Colors.purple.shade300,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(5),
                                       ),
                                       child: Text('تفاصيل الطفل',),
                                       textColor:Colors.white,
                                     ),
                                   ),

                                   ButtonBar(
                                     mainAxisSize: MainAxisSize.min,
                                     children: <Widget>[
                                       RaisedButton(
                                         onPressed: () async {
                                           if (doc['checkReg'] == 'waiting')
                                             await FirebaseFirestore.instance
                                                 .collection("Centers")
                                                 .doc(user!.uid)
                                                 .collection("Registration").doc(doc['childID']).update(
                                                 {
                                                   'checkReg': 'Accept',
                                                 });
                                           print(doc['checkReg']);
                                         },
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(5),
                                         ),
                                         child: const Text('قبول'),
                                         textColor: Colors.black,
                                         color: Colors.purple[200],
                                         padding: EdgeInsets.all(2),
                                       ),
                                       RaisedButton(
                                         onPressed: () {
                                           if (doc['checkReg'] == 'waiting')
                                              FirebaseFirestore.instance
                                                 .collection("Centers")
                                                 .doc(user!.uid)
                                                 .collection("Registration").doc(doc['childID']).update(
                                                 {
                                                   'checkReg': 'Reject',
                                                 });
                                           print(doc['checkReg']);
                                         },
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(5),
                                         ),
                                         child: const Text('رفض'),
                                         textColor: Colors.black,
                                         color: Colors.red,
                                         padding: EdgeInsets.all(2),
                                       )],
                                   ),]
                             ),],
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