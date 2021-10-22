import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  ChatScreen extends StatefulWidget {

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(
            'المحادثة',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ''
            ),
            ShowMessage(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                color: Colors.purple.shade300,
              width: 0.2,
            ),
            ),
                      ),

                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(
                        hintText: "أدخل الرسالة..."
                    ),
                  ),
                ),
                ),
                IconButton(
                    onPressed: (){
                      if (msg.text.isNotEmpty){
                           msg.clear();
                      }
                    },
                    icon: Icon(Icons.send,
                    color: Colors.purple.shade300,))
              ],
              ),
          ],
        ),
      );
}
class ShowMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text('messages'),
                );
              }
          );
        }
    );
  }

}
