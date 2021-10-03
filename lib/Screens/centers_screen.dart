import 'package:flutter/material.dart';
import 'package:kidzone_app/widgets/centers_grid.dart';

class CentersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز الحضانة'),
      ),
      body: CentersGrid(),
    );
  }
}
