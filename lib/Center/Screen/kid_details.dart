import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KidDetails extends StatefulWidget {
  final kidInfo;
  KidDetails(this.kidInfo);

  @override
  State<KidDetails> createState() => _KidDetailsState();
}

class _KidDetailsState extends State<KidDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: new Color(0xFFFFFFFF),
                  gradient: LinearGradient(
                    colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 20,),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "معلومات الطفل ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),),
                        )],
                    )
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.topCenter,
                child: Card(
                  margin: EdgeInsets.all(30),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 25,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.person_outlined,
                          color: Colors.purple[300],
                          size: 25,),
                        title: Text(widget.kidInfo['name']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.purple[300],
                          size: 25,),
                        title: Text(widget.kidInfo['dateBooking']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.purple[300],
                          size: 25,),
                        title: Text(widget.kidInfo['phoneNumber']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.purple,
                          size: 25,),
                        title: Text(widget.kidInfo['gender']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.purple,
                          size: 25,
                        ),
                        title: Text(widget.kidInfo['dateBooking']),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.timer,
                          color: Colors.purple,
                          size: 25,),
                        title: Row(
                          children: [
                            Text(widget.kidInfo["startTimeBooking"]),
                            Text(widget.kidInfo["endTimeBooking"]),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.check,
                          color: Colors.purple,
                          size: 25,),
                        title:
                            Text(widget.kidInfo["checkReg"]),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 5, bottom: 5,top:
                  10),
                  padding: EdgeInsets.only(left: 255, ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,size: 33,color:
                    Colors.purple[300],),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
              ),]
            )
        )
    );
  }
}
