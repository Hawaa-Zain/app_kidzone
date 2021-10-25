import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KidsGrid extends StatelessWidget {
  KidsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
      child: Card(
      margin: EdgeInsets.all(15),
      color: Colors.purple[50],
      shadowColor: Colors.black,
      elevation: 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.person, color: Colors.purple[300], size: 30,),
          ),
           ListTile(
            leading: Icon(Icons.date_range_outlined, color: Colors.purple[300], size: 30,),
          ),
           ListTile(
            leading: Icon(Icons.phone,color: Colors.purple[300], size: 30,),
          ),
           ListTile(
            leading: Icon(Icons.app_registration, color: Colors.purple[300], size: 30,),
          ),
        ],
      ),
    ),
    ));

  }
}