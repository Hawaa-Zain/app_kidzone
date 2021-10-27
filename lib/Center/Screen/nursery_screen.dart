import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/Request_grid.dart';

class NurseryScreens extends StatefulWidget {
  @override
  _NurseryScreenState createState() => _NurseryScreenState();
}

class _NurseryScreenState extends State<NurseryScreens> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('طلبات التسجيل '),
          backgroundColor: Colors.purple[300],
        ),
        body: RequestGrid(),
      );
}
