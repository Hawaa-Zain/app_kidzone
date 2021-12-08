import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';
import 'package:kidzone_app/Parent/parent_Bottom_Tab_screen.dart';
import 'package:kidzone_app/Parent/widgets/center_chat_body_widget.dart';
import '../../firebase_api.dart';

class ParentChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 8,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> ParentBottomTabsScreen()
          ));

        },
      ),
      title: Text('المحادثات'),
      backgroundColor: Colors.purple[300],
    ),
    body: SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Centers').snapshots(),
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
              itemBuilder: (context, index)
          {
            final doc = snapshot.data.docs[index];
            return Column(
              children: [
                //ChatHeaderWidget(users: users),
                CenterChatBody(centers: doc)
              ],
            );

          }
          );
          }
      ),
    ),
  );

  Widget buildText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}