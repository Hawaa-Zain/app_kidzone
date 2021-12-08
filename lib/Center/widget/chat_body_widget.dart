import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/chatting/chat_page.dart';


class ChatBodyWidget extends StatelessWidget {
  final doc; //parent

  const ChatBodyWidget({
    @required this.doc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: buildChats(),
    ),
  );

  Widget buildChats() => ListView.builder(
      shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final parent = doc[index];

      return Container(
        height: 75,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatPage(parent: parent,),
            ));
          },
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(parent['image_url']),
          ),
          title: Text(parent['name']),
        ),
      );
    },
    itemCount: 1,
  );
}
