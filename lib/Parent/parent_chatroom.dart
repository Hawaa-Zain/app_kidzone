import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/chatrooms.dart';

import 'Parent_Order_Track.dart';

class ParentChatroom extends StatefulWidget {
  final userName;

  ParentChatroom({this.userName});

  @override
  _ParentChatroomState createState() => _ParentChatroomState();
}

class _ParentChatroomState extends State<ParentChatroom> {





  @override
  Widget chatRoomsList() {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Centers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot.data);
          return CircularProgressIndicator();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                userName: snapshot.data.docs[index]['name'],
                // .toString()
                // .replaceAll("_", "")
                //.replaceAll(Constants.myName, ""),
                chatRoomId: '${widget.userName}_${snapshot.data.docs[index]["name"]}',
              );
            });

      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('المحادثات'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        child: chatRoomsList(),
      ),

    );
  }
}

// class ParentChatRoomsTile extends StatelessWidget {
//   final String userName;
//   final String chatRoomId;
//
//   ParentChatRoomsTile({this.userName,@required this.chatRoomId});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context) => Chat(
//               chatRoomId: chatRoomId,
//             )
//         ));
//       },
//       child: Container(
//         color: Colors.black26,
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         child: Row(
//           children: [
//             Container(
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                   color: Colors.purple,
//                   borderRadius: BorderRadius.circular(30)),
//               child: Text(userName.substring(0, 1),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontFamily: 'OverpassRegular',
//                       fontWeight: FontWeight.w300)),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Text(userName,
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'OverpassRegular',
//                     fontWeight: FontWeight.w300))
//           ],
//         ),
//       ),
//     );
//   }
// }
