import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublishAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(
        child: SizedBox(
            height: 300,
            width: 400,
            child: Card(
              color: Colors.white10,
              shadowColor: Colors.black.withAlpha(30),
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Expanded(
                      child: FittedBox(
                    child: IconButton(
                      icon: Icon(Icons.photo_library,
                          color: Colors.purple[300], size: 10),
                      onPressed: () {
                        //write your code//
                      },
                    ),
                  )),
                ),
              ),
            )),
      ),
      SizedBox(height: 200),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                //write your code//
              },
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
              color: Colors.purple.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                ' نشر ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),

    ]);
  }
}
