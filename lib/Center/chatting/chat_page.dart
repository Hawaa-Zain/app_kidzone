import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/model/parents_forchat.dart';
import 'package:kidzone_app/Center/widget/messages_widget.dart';
import 'package:kidzone_app/Center/widget/new_message_widget.dart';
import 'package:kidzone_app/Center/widget/profile_header_widget.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/user_model.dart';

class ChatPage extends StatefulWidget {
  final parent;

  const ChatPage({
    @required this.parent,
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: Colors.purple[300],
    body: SafeArea(
      child: Column(
        children: [
          //ProfileHeaderWidget(name: widget.user.name),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: MessagesWidget(idUserformedoc: widget.parent['userID'] +'${user.uid}'),
            ),
          ),
          NewMessageWidget(idUserformedoc: widget.parent['userID'] +'${user.uid}'),
        ],
      ),
    ),
  );
}
