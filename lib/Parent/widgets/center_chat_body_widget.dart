import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/chatting/center_chat_page.dart';


import '../parent_Bottom_Tab_screen.dart';

class CenterChatBody extends StatelessWidget {
  final  centers; //full doc for the center

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
              builder: (context) => CenterChatPage(),
            ));
          },
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(centers['image_url']),
          ),
          title: Text(centers['name']),
        ),
      );
    },
    itemCount: centers.length,
  );
}
