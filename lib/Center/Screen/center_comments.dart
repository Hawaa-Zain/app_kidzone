import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';


class CenterComments extends StatefulWidget {
  @override
  State<CenterComments> createState() => _CenterCommentsState();
}

class _CenterCommentsState extends State<CenterComments> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(' التعليقات'),
      backgroundColor: Colors.purple[300],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CentersBottomTapsScreens()
          ));

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
                ),
              ),
            ),
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
