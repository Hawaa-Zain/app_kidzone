import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/Parent_Order_Track.dart';

class ParentTapTrackOrder extends StatelessWidget {
  const ParentTapTrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(' الحجوزات '),
          backgroundColor: Colors.purple[300],
          bottom:  TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(
                Icons.hourglass_bottom_outlined,
                color:Colors.black,),
                  child:  Text('الطلبات الجديده',
                    style:TextStyle(fontSize: 12) ,)
              ),
              Tab(icon: Icon(
                  Icons.hourglass_disabled_outlined ,
                  color: Colors.black),
                  child: const Text('الطلبات السابقة',
                    style:TextStyle(fontSize: 12),)
              ),],
          ),

        ),
        body:  TabBarView(
          children: [
            ParentOrderTrackPage(),
            Icon(Icons.directions_car),
          ],
        ),
      ),
    );
  }
}