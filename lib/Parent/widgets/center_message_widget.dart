import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/model/message.dart';

class CenterMessageWidget extends StatelessWidget {
  final message; //whole message doc
  final bool isMe;

  const CenterMessageWidget({
    @required this.message,
    @required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe)
          CircleAvatar(
            backgroundColor: Colors.purple.shade300,
            //radius: 16, backgroundImage: NetworkImage(message.image_url),
          ),
        Container(

          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(

            color: isMe ? Colors.grey[100] : Theme.of(context).focusColor,
            borderRadius: isMe
                ? borderRadius.subtract(BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(BorderRadius.only(bottomLeft: radius)),
          ),
          child: buildMessage(),
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
    crossAxisAlignment:
    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        message.message,
        style: TextStyle(color: isMe ? Colors.black : Colors.black54),
        textAlign: isMe ? TextAlign.end : TextAlign.start,
      ),
    ],
  );
}
