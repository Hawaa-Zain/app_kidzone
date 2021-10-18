import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/nursery_screens.dart';

class BostAdvScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعلانات '),
      ),
      body: Column(
          children: <Widget>[
            Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.black.withAlpha(30),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => NurseryScereens()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Expanded(
                        child: FittedBox(
                          child: Image.asset(
                            "assets/images/adv hugs nursery.jpeg",
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        )),

                  ),
                ),
                elevation: 9,
                shadowColor: Colors.grey[900],
                margin: EdgeInsets.all(10),

              ),

            ),
    Center(
    child: Card(
    child: InkWell(
    splashColor: Colors.black.withAlpha(30),
    onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => NurseryScereens()));
    },
    child: Padding(
    padding: EdgeInsets.all(10),
    child: Expanded(
    child: FittedBox(
    child: Image.asset(
    "assets/images/adv wonderful.jpeg",
    height: 200,
    width: 200,
    fit: BoxFit.cover,
    ),
    )),

    ),
    ),
    elevation: 9,
    shadowColor: Colors.grey[900],
    margin: EdgeInsets.all(10),
    ),
    ),
    ],

      ),
    );
  }
}