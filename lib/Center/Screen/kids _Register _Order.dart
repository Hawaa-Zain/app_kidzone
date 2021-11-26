import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/order_Kids.dart';

class KidsRegisterOrder extends StatelessWidget {
  const KidsRegisterOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[300],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(
                  Icons.clear,
                  color:Colors.black,),
                    child:  Text('الطلبات المرفوضة',
                      style:TextStyle(fontSize: 10) ,)
                ),
                Tab(icon: Icon(
                    Icons.done_outline,
                    color: Colors.black),
                    child: const Text('الطلبات المقبولة',
                        style:TextStyle(fontSize: 10),)
                ),
                Tab(icon: Icon(
                    Icons.hourglass_bottom_outlined,
                    color: Colors.black),
                    child: const Text('بإنتطار الرد',
                      style:TextStyle
                      (fontSize: 10) ,)
                ),],
            ),
            title: const Text('طلبات التسجيل '),
          ),
          body:  TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              OrderKids(),
            ],
          ),
        ),
      ),
    );
  }
}