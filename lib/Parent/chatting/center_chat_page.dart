import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';
import 'package:kidzone_app/Parent/widgets/center_messages_widget.dart';
import 'package:kidzone_app/Parent/widgets/center_new_message_widget.dart';
import 'package:kidzone_app/user_model.dart';


class CenterChatPage extends StatefulWidget {
  final center;

  const CenterChatPage({
    @required this.center,
    Key key,
  }) : super(key: key);

  @override
  _CenterChatPageState createState() => _CenterChatPageState();
}

class _CenterChatPageState extends State<CenterChatPage> {
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
              child: CenterMessagesWidget(idUserformedoc: widget.center['userID'] +'${user.uid}',),
            ),
          ),
          CenterNewMessageWidget(idUserformedoc: widget.center['userID'] +'${user.uid}',
              image_url: widget.center['image_url'], userName: widget.center['name'])
        ],
      ),
    ),
  );
}
