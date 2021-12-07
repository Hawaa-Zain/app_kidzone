import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/Parent_Tap_Track_Order.dart';
import 'package:kidzone_app/Parent/search_service.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


User user = FirebaseAuth.instance.currentUser;

class CentersScreen extends StatefulWidget {
  @override
  CentersScreenState createState() => CentersScreenState();
}

class CentersScreenState extends State<CentersScreen> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(String value){
    if (value.length == 0){
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });

    }
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1){
      SearchService().searchByName(value).then((QuerySnapshot docs){
        for (int i=0; i<docs.docs.length; i++){
          queryResultSet.add(docs.docs[i].data());
        }
      });
    }
    else{
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if(element['name'].startsWith(capitalizedValue)){
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // title: Column(
        //   children: [
        //     Text('مراكز الحضانة'),
        //   ],
        // ),
        backgroundColor: Colors.purple[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  onChanged: (val){
                    initiateSearch(val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      iconSize: 20,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: 'ابحث عن حضانة',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ParentTapTrackOrder(),
                  ));
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CentersGrid(),
    );
  }
}





