import 'package:flutter/material.dart';


  class Order extends StatefulWidget {
    _OrderState createState() => _OrderState();
  }
  class  _OrderState extends State<Order>{
@override
  Widget build(BuildContext context) =>
     ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (
      BuildContext context, int index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
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
                  ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('معلومات الطفل',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10,
                          ),
                          child: RaisedButton(
                          onPressed: (){},
                            color: Colors.purple.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('تفاصيل الطفل'),
                          ),
                            ),
                         ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('قبول'),
                              textColor: Colors.black,
                              color: Colors.purple[200],
                              padding: EdgeInsets.all(2),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('رفض'),
                              textColor: Colors.black,
                              color: Colors.purple[200],
                              padding: EdgeInsets.all(2),
                            )
            ],
                          ),
    ]
                        ),
      ],
      ),
            ],
          ),
    ),
      ),
    ),
      );
    }
