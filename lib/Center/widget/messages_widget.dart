import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/model/message.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/Parent/widgets/centers_item.dart';
import '../../firebase_api.dart';
import 'message_widget.dart';


class MessagesWidget extends StatefulWidget {
  final String idUserformedoc;


  const MessagesWidget({
    @required this.idUserformedoc,
    Key key,
  }) : super(key: key);

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {

  User _user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    // async and await important
    User userData = FirebaseAuth.instance.currentUser; // current user
    setState(() {
      _user = userData;
      print(userData.uid);
      print(userData.email);
    });
  }


  @override
  Widget build(BuildContext context) => StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('chats').doc(widget.idUserformedoc)
        .collection('message').snapshots(),
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
              physics: BouncingScrollPhysics(),
              reverse: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final message = snapshot.data.docs[index];

                  // final newMessage = Message(
                  //   userID: message.userID,
                  //   image_url: message.image_url,
                  //   username: message.username,
                  //   message: message.message,
                  //   createdAt: DateTime.now(),
                  // );
                  // final refMessages =
                  // FirebaseFirestore.instance.collection('chats/${user.uid}/messages');
                  // refMessages.add(newMessage.toJson());


                return MessageWidget(
                  message: message,
                  isMe: message['userID'] == _user,
                );
              },
            );
    },
  );

  Widget buildText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
  );
}
