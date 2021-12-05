import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/chatting/center_chat_page.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';

class CenterChatBody extends StatelessWidget {
  final List<Centers> centers;

  const CenterChatBody({
    @required this.centers,
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
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final user = centers[index];

      return Container(
        height: 75,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CenterChatPage(user: user),
            ));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.image_url),
          ),
          title: Text(user.name),
        ),
      );
    },
    itemCount: centers.length,
  );
}
