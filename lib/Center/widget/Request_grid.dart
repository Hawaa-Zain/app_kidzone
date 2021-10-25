import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestGrid extends StatelessWidget {
  RequestGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Container(
      width: 400,
      height: 250,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.purple[50],
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.person, size: 30),
              title: Text('اسم الطفل',
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.date_range_outlined, size: 30),
              title: Text(' العمر  \ تاريخ الميلاد',
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: const Text('قبول'),
                  textColor: Colors.black,
                  color: Colors.purple[200],
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: const Text('رفض'),
                  textColor: Colors.black,
                  color: Colors.purple[200],
                  padding: EdgeInsets.all(10),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
