import 'package:flutter/material.dart';

class KidsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('معلومات الطفل'),
      backgroundColor: Colors.purple[300],
    ),
    body: Container(
        alignment: Alignment.topCenter,
        child: Card(
          margin: EdgeInsets.all(15),
          color: Colors.white,
          shadowColor: Colors.black,
          elevation: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.group_outlined,
                  color: Colors.purple[300],
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.date_range_outlined,
                  color: Colors.purple[300],
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.purple[300],
                  size: 30,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.assignment_turned_in_outlined   ,
                  color: Colors.purple,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }

