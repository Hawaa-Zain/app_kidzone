import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidzone_app/Center/model/message.dart';
import '../../firebase_api.dart';

class NewMessageWidget extends StatefulWidget {
  final String idUserformedoc;
  final String image_url;
  final String userName;

  const NewMessageWidget({
    @required this.idUserformedoc,
    Key key, this.image_url, this.userName,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';
  DateTime lastMessageTime;

  static Future uploadMessage(String idUserformedoc, String message, String image_url, String userName) async {

    FirebaseFirestore.instance.collection('chats/$idUserformedoc/messages')
    .add({
      'userID': idUserformedoc,
      'image_url': image_url,
      'name': userName,
      'message': message,
      "createdAt": DateTime.now(),
    });


    // final newMessage = Message(
    //   idUser: myId,
    //   urlAvatar: myUrlAvatar,
    //   username: myUsername,
    //   message: message,
    //   createdAt: DateTime.now(),
    // );
    // await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('Parent');
    await refUsers
        .doc(idUserformedoc)
        .update({'lastMessageTime': DateTime.now()});
  }

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    await uploadMessage(widget.idUserformedoc, message, widget.image_url, widget.userName);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              labelText: 'أكتب رسالتك هنا...',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                gapPadding: 10,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onChanged: (value) => setState(() {
              message = value;
            }),
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: message.trim().isEmpty ? null : sendMessage,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
            child: Icon(Icons.send, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}