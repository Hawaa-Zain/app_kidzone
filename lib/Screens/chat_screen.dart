import 'package:flutter/material.dart';

class  ChatScreen extends StatefulWidget {


  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(
            'المحادثة',
          ),
        ),

      );
}

