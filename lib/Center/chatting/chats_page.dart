import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';
import 'package:kidzone_app/Center/model/parents_forchat.dart';
import 'package:kidzone_app/Center/widget/chat_body_widget.dart';
import '../../firebase_api.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
      elevation: 8,
        leading: IconButton(
         icon: Icon(Icons.arrow_back),
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (_)=> CentersBottomTapsScreens()
           ));

         },
       ),
       title: Text('المحادثات'),
       backgroundColor: Colors.purple[300],
     ),
    body: SafeArea(
      child: StreamBuilder<List<User>>(
        stream: FirebaseApi.getUsers(),
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
                      ChatBodyWidget(users: users)
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