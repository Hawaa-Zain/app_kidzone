import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/order.dart';

class KidsRegisterOrder extends StatefulWidget {
  @override
  _KidsRegisterOrder createState() => _KidsRegisterOrder();
}

class _KidsRegisterOrder extends State<KidsRegisterOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلبات التسجيل '),
        backgroundColor: Colors.purple[300],
      ),
      body: Order(),

    );
  }
}
