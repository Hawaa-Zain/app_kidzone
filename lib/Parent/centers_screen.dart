import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';

class CentersScreen extends StatefulWidget {
  @override
  CentersScreenState createState() => CentersScreenState();
}

class CentersScreenState extends State<CentersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز الحضانة'),
        backgroundColor: Colors.purple[300],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(onPressed: (){
          },
              icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CentersGrid(),
    );
  }
}
