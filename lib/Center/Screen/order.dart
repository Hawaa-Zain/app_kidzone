import 'package:flutter/material.dart';


class Order extends StatefulWidget {
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (
              BuildContext context, int indx) => Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                        Container(
                          width: 25.0,
                          height: 25.0,
                          color: Colors.white,
                          padding: const EdgeInsets.all(17),
                          child: ListTile(

                            title: Text('اسم الطفل',
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold)),
                            leading: Icon(
                              Icons.group_outlined,
                              size: 30,
                              color: Colors.purple[200],
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget> [
                            Text('اسم الطفل',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: FlatButton(
                                onPressed: (){},
                                color: Colors.purple.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text('معلومات الطفل'),
                              ),
                            ),
                          ],
                        ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: FlatButton(
                        onPressed: (){},
                        color: Colors.purple.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text('قبول'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: FlatButton(
                        onPressed: (){},
                        color: Colors.purple.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text('رفض'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        ),
      );
    }
  }


