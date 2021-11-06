import 'package:flutter/material.dart';

class CenterOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل الطلب'),
          backgroundColor: Colors.purple[300],

        ),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.topCenter,
                child: Card(
                  margin: EdgeInsets.all(30),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.group_outlined,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.access_time,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.child_friendly_outlined,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.purple[300],
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],)));
  }
}
