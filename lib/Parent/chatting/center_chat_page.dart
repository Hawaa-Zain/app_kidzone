import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';
import 'package:kidzone_app/Parent/widgets/center_messages_widget.dart';
import 'package:kidzone_app/Parent/widgets/center_new_message_widget.dart';


class CenterChatPage extends StatefulWidget {
  final Centers user;

  const CenterChatPage({
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  _CenterChatPageState createState() => _CenterChatPageState();
}

class _CenterChatPageState extends State<CenterChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: Colors.purple,
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
              child: CenterMessagesWidget(idUser: widget.user.userID),
            ),
          ),
          CenterNewMessageWidget(userID: widget.user.userID)
        ],
      ),
    ),
  );
}
