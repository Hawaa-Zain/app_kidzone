import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';
import 'package:kidzone_app/Center/model/parents_forchat.dart';
import 'package:kidzone_app/Center/widget/chat_body_widget.dart';
import 'package:kidzone_app/user_model.dart';
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
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Parent').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            print(snapshot.data);
            return CircularProgressIndicator();
          }


          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
                  return ListView.builder(
                      shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
  itemBuilder: (context, index) {
  final doc = snapshot.data.docs[index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //ChatHeaderWidget(users: users),
                          ChatBodyWidget(doc: doc,)
                        ],

                      ),
                    );
  } );
              
          
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