import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/Kids_grid.dart';

class KidsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات الطفل'),
        backgroundColor: Colors.purple[300],
      ),
      body: KidsGrid(),
    );
  }
}
