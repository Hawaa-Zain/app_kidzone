import 'package:flutter/material.dart';

class KidDetails extends StatelessWidget {
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
                          margin: EdgeInsets.only(right: 20, top: 20),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "معلومات الطفل ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 60),
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
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.purple[300],
                          size: 25,),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.purple[300],
                          size: 25,),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.assignment_turned_in_outlined,
                          color: Colors.purple,
                          size: 25,),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.purple,
                          size: 25,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.timer,
                          color: Colors.purple,
                          size: 25,),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
