import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Center_Signup.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}
class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلباتي"),
        backgroundColor: Colors.purple[300],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Parent")
              .doc(user!.uid)
              .collection("Children")
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
              itemBuilder: (context, index) {
                final doc = snapshot.data!.docs[index];
                return Column(
                  children: [
                    ListTile(
                      trailing: Text(
                          doc['name']),
                      title: Text(doc['dateBooking']),
                      leading: ElevatedButton(
                        onPressed: (){}, child: Text('المزيد'),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
