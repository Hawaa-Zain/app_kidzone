import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Center_Signup.dart';
import 'package:kidzone_app/Parent/parent_signup_screen.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';


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
                    builder: (context) => OrdersPage(),
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
