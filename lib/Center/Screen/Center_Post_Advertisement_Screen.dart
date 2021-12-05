import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';
import 'package:kidzone_app/Parent/centers_screen.dart';


class CenterPostAdvertisementScreens extends StatefulWidget {

  @override
  State<CenterPostAdvertisementScreens> createState() => _CenterPostAdvertisementScreensState();
}

class _CenterPostAdvertisementScreensState extends State<CenterPostAdvertisementScreens> {
  File _image;

  void pickImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // from 0,100 .. to be more fast in stoarge and restore
      maxWidth: 150,
    );
    setState(() {
      _image = File(image.path);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(' اعلانات '),
          backgroundColor: Colors.purple[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> CentersBottomTapsScreens()
            ));

          },
        ),

      ),
        body: Column(
          children:<Widget>[
                  IconButton(
                    icon: Icon(Icons.add_box_rounded , size: 50,color: Colors.purple
                        .shade300,),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    padding: EdgeInsets.only(left: 50, right:200, top: 500,
                        bottom: 50),

                  ),]
        ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("نشر"),
      onPressed:  () async {
        final ref = FirebaseStorage.instance
            .ref()
            .child('Adsimage')
            .child(user.uid + '.jpg');
        await ref.putFile(_image);
        final url = await ref.getDownloadURL();

        FirebaseFirestore.instance.collection('ads').doc().set({
          'image_url': url,
          "time": DateTime.now(),
          'title': ''
        });
        Navigator.pop(context);
      },
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
          onPressed: pickImage,
        ),
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
