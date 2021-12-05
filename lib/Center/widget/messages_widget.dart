import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/model/message.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';
import '../../firebase_api.dart';
import 'message_widget.dart';


class MessagesWidget extends StatelessWidget {
  final String idUser;

  const MessagesWidget({
    @required this.idUser,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
    stream: FirebaseApi.getMessages(idUser),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          if (snapshot.hasError) {
            return buildText('Something Went Wrong Try later');
          } else {
            final messages = snapshot.data;

            return messages.isEmpty
                ? buildText('Say Hi..')
                : ListView.builder(
              physics: BouncingScrollPhysics(),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

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
                  isMe: message.userID == user.uid,
                );
              },
            );
          }
      }
    },
  );

  Widget buildText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
  );
}
