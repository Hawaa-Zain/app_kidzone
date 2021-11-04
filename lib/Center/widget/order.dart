import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/kid_details.dart';

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
                        SizedBox(height: 33),
                        IconButton(
                         icon:  Icon(Icons.group_outlined),
                            onPressed: (){},
                            color: Colors.purple.shade300),
                        Text("اسم الطفل",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),),
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
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => KidsDetails()),
      );},
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

               )
      )
        )
        ),

      );
    }
}