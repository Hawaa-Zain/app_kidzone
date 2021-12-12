import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/chatrooms.dart';

import 'Parent_Order_Track.dart';

class ParentChatroom extends StatefulWidget {
  final userName;

  ParentChatroom({this.userName});

  @override
  _ParentChatroomState createState() => _ParentChatroomState();
}

class _ParentChatroomState extends State<ParentChatroom> {





  @override
  Widget chatRoomsList() {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Centers').snapshots(),
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
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.docs[index]['name'],
                // .toString()
                // .replaceAll("_", "")
                //.replaceAll(Constants.myName, ""),
                chatRoomId: '${widget.userName}_${snapshot.data.docs[index]["name"]}',
              );
            });

      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('المحادثات'),
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        child: chatRoomsList(),
      ),

    );
  }
}


