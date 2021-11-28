import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CenterOrderDetails extends StatefulWidget {
  @override
  State<CenterOrderDetails> createState() => _CenterOrderDetails();
}
class _CenterOrderDetails extends State<CenterOrderDetails> {
  bool isButtonActive = true;

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
                      SizedBox(height: 5,width: 15,),
                      Row(
                        children:[
                          SizedBox(width: 10,),
                          ElevatedButton(
                            child: Text("موافق ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black,
                              primary: Colors.green,
                              onSurface: Colors.grey[700],
                              elevation: 3,
                              padding: EdgeInsets.only(left: 50, right: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed:isButtonActive?(){
                              setState(() {
                                isButtonActive = false;
                              });
                            }:null,
                          ),
                          SizedBox(height: 40,width: 15,),
                          Row(
                            children:[
                              ElevatedButton(
                                child: Text("رفض ",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.black,
                                  primary: Colors.red,
                                  onSurface: Colors.grey[700],
                                  elevation: 3,
                                  padding: EdgeInsets.only(left: 50, right: 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed:isButtonActive?(){
                                  setState(() {
                                    isButtonActive = false;
                                  });
                                }:null,
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
