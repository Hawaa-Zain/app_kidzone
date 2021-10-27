import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/kid_details.dart';

class RequestGrid extends StatelessWidget {
  RequestGrid({Key? key}) : super(key: key);

  final myKids = List<String>.generate(5, (i) => 'Product $i');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: myKids.length,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: 200,
                  child: Card(
                      shadowColor: Colors.black.withAlpha(300),
                      child: Padding(
                        padding: const EdgeInsets.all(19),
                        child: ListTile(
                          leading: Icon(
                            Icons.group_outlined,
                            size: 30,
                            color: Colors.purple[200],
                          ),
                          title: Text('اسم الطفل',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold)),
                          trailing: SizedBox(
                            height: 100,
                            child: ButtonBar(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => KidsDetails(),
                                        ));
                                  },
                                  child: const Text("تفاصيل الطفل"),
                                  textColor: Colors.black,
                                  color: Colors.purple[100],
                                  padding: EdgeInsets.all(9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                    height: 100,
                                    child: ButtonBar(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        RaisedButton(
                                          onPressed: () {},
                                          child: const Text('قبول'),
                                          textColor: Colors.black,
                                          color: Colors.purple[200],
                                          padding: EdgeInsets.all(2),
                                        ),
                                        RaisedButton(
                                          onPressed: () {},
                                          child: const Text('رفض'),
                                          textColor: Colors.black,
                                          color: Colors.purple[200],
                                          padding: EdgeInsets.all(2),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )));
            }));
  }
}
