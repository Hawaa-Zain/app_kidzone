import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';
import 'package:kidzone_app/Parent/widgets/center_chat_body_widget.dart';
import '../../firebase_api.dart';

class ParentChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.purple,
    body: SafeArea(
      child: StreamBuilder<List<Centers>>(
        stream: FirebaseApi.getCentersUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return buildText('Something Went Wrong Try later');
              } else {
                final users = snapshot.data;

                if (users.isEmpty) {
                  return buildText('No Users Found');
                } else
                  return Column(
                    children: [
                      //ChatHeaderWidget(users: users),
                      CenterChatBody(centers : users)
                    ],
                  );
              }
          }
        },
      ),
    ),
  );

  Widget buildText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}