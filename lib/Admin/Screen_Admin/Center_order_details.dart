import 'package:flutter/cupertino.dart';
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
            child: Column(
              children: [
                SizedBox(height: 25,),
              Container(
                alignment: Alignment.center,
                child: Card(
                  margin: EdgeInsets.all(20),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
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
                      SizedBox(height: 5),
                      Row(
                        children:[
                          GestureDetector(
                            onTap: () {

                              //Write  Code Here.
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 20, right: 20,
                                  top: 50,bottom: 10),
                              padding: EdgeInsets.only(left: 55, right: 55),
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: Text(
                                "موافق",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:
                                15),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children:[
                              GestureDetector(
                                onTap: () {
                                  //Write  Code Here.
                                },

                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 8, right: 10,
                                      top: 50,bottom: 10),
                                  padding: EdgeInsets.only(left: 55, right: 55),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color: Color(0xffEEEEEE)),
                                    ],
                                  ),
                                  child: Text(
                                    "رفض",
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,fontSize:
                                        15),),
                                ),
                              ),],
                          ),],
                      ),],
                  ),
                ),

              ),],
            )
        )
    );
  }
}
