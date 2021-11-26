import 'package:flutter/material.dart';


class CenterPostAdvertisementScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(' اعلاناتي '),
          backgroundColor: Colors.purple[300],

      ),
        body:  SingleChildScrollView(
          child: Column(children: <Widget>[
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
                                onPressed: () {},
                              ),
                            )),
                      ),),
                  )),
            ),
            SizedBox(height: 200),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RaisedButton(
                    onPressed: () {},
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
                        fontSize: 20,),),
                  ),],
              ),
            ),]
          ),
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
