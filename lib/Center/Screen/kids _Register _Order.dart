import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/order_Kids.dart';

class KidsRegisterOrder extends StatelessWidget {
  const KidsRegisterOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('طلبات التسجيل '),
          backgroundColor: Colors.purple[300],
          automaticallyImplyLeading: false,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(
                  icon: Icon(
                    Icons.hourglass_bottom_outlined,
                    color: Colors.black,
                  ),
                  child: Text(
                    'بإنتطار الرد',
                    style: TextStyle(fontSize: 10),
                  )),
              Tab(
                  icon: Icon(Icons.done_outline, color: Colors.black),
                  child: const Text(
                    'الطلبات المقبولة',
                    style: TextStyle(fontSize: 10),
                  )),
              Tab(
                  icon: Icon(Icons.clear, color: Colors.black),
                  child: const Text(
                    'الطلبات المرفوضة',
                    style: TextStyle(fontSize: 10),
                  )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrderKids(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_car),
          ],
        ),
      ),
    );
  }
}
