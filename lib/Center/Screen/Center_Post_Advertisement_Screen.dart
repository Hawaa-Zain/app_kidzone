import 'package:flutter/material.dart';


class CenterPostAdvertisementScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(' اعلاناتي '),
          backgroundColor: Colors.purple[300],

      ),
        body:Container(
            margin: EdgeInsets.only(left: 5, right: 20, bottom: 5,top: 500),
            padding: EdgeInsets.only(left: 10, right: 20),
            child:FloatingActionButton(
              backgroundColor:Colors.purple[300],
              foregroundColor: Colors.white,
              onPressed: () {
                showAlertDialog(context);
                },
              child: Icon(Icons.add),
            )
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("نشر"),
      onPressed:  () {},
    );
    Widget continueButton = TextButton(
      child: Text("الغاء"),
      onPressed:  () {
        Navigator.pop(context, MaterialPageRoute(builder: (_)=>
            CenterPostAdvertisementScreens()
        ));

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("نشر إعلان",style: TextStyle(fontSize: 20, color: Colors
          .purple[300]),
      ),
      content: Row(children: [
        Text("ارفاق صورة للإعلان",style: TextStyle(fontSize: 15, color:
        Colors.black),
      ),
        IconButton(
          icon: Icon(Icons.photo_camera,color:Colors.purple[200]),
          onPressed: () {},),
      ], ),

      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
