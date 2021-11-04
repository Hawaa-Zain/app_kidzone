import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/widget_Admin/order_center.dart';


class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdmin createState() => _HomeAdmin();
}

class _HomeAdmin extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلبات مراكز الحضانة '),
        backgroundColor: Colors.purple[300],
        automaticallyImplyLeading: false,
      ),
      body: OrderCenter(),

    );
  }
}