import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/Rquest_grid.dart';

class NurseryScereens extends StatefulWidget {
  @override
  _NurseryScereensState createState() => _NurseryScereensState();
}

class _NurseryScereensState extends State<NurseryScereens> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('طلبات التسجيل '),
          backgroundColor: Colors.purple[300],
        ),
        body: RquestsGrid(),
      );
}
