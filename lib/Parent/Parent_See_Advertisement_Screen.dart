// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/parent_Bottom_Tab_screen.dart';

void main() => runApp(ParentSeeAdvertisement());

class ParentSeeAdvertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('الإعلانات '),
      backgroundColor: Colors.purple[300],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ParentBottomTabsScreen()));
        },
      ),
    ),
    body:  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("ads").snapshots(),
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
                return Column(
                  children: <Widget>[
                    Center(
                      child: Card(
                        child: InkWell(
                          splashColor: Colors.black.withAlpha(30),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DetailScreen(imgUrl: doc['image_url'].toString())));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Expanded(
                                child: FittedBox(
                                  child: Image.network(
                                    doc['image_url'],
                                    height: 350,
                                    width: 400,
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                          ),
                        ),
                        elevation: 5,
                        shadowColor: Colors.grey[900],
                        margin: EdgeInsets.all(10),
                      ),
                    ),],
                );
              });
        }),

  );
}

class DetailScreen extends StatelessWidget {
  final String imgUrl;

  DetailScreen({Key key,this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
                child: Hero(
                  tag: 'imageHero',
                  child: Expanded(
                    child: FittedBox(
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))));
  }
}