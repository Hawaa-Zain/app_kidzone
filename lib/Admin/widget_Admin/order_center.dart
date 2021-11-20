import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/Screen_Admin/Center_order_details.dart';


class OrderCenter extends StatefulWidget {
  @override
  State<OrderCenter> createState() => _OrderCenter();
}
class _OrderCenter extends State<OrderCenter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (
              BuildContext context, int index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                  elevation: 5.0,
                  color: Colors.purple.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),

                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Icon(Icons.group_outlined,
                                    color: Colors.purple.shade300,
                                    size: 30,
                                  ),
                                ],
                              )
                            ]
                        ),
                        SizedBox(width: 5),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10,
                                ),
                                child: ElevatedButton(
                                    child: Text("تفاصيل مركز الحضانة"),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 80),
                                      onPrimary: Colors.white,
                                      primary: Colors.purple[300],
                                      onSurface: Colors.grey,
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(borderRadius:
                                      BorderRadius.circular(5)),
                                    ),
                                    onPressed:() {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            CenterOrderDetails()),
                                      );},
                              ),)]
                        ),],
                    ),
                  ),
              ),),
      ),
    );
  }
}