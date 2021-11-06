import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Centers_taps_screen.dart';

class CenterChatScreens extends StatefulWidget {
  @override
  State<CenterChatScreens> createState() => _CenterChatScreens();
}

class _CenterChatScreens extends State<CenterChatScreens> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('المحادثة'),
          backgroundColor: Colors.purple[300],
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CentersTapsScreens()),
              );
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(''),
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
                    child: TextFormField(
                      controller: msg,
                      decoration: InputDecoration(hintText: "أكتب الرسالة..."),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (msg.text.isNotEmpty) {
                        msg.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.purple.shade300,
                    ))
              ],
            ),
          ],
        ),
      );
}

class ShowMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(itemBuilder: (context, i) {
        return ListTile(
          title: Text('messages'),
        );
      });
    });
  }
}
