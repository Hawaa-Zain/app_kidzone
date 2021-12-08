// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/Parent_Tap_Track_Order.dart';
import 'package:kidzone_app/Parent/search_service.dart';
import 'package:kidzone_app/Parent/widgets/centers_grid.dart';

User user = FirebaseAuth.instance.currentUser;

class CentersScreen extends StatefulWidget {
  @override
  CentersScreenState createState() => CentersScreenState();
}
String searchWord = '';
bool showTextField = false;

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

  TextEditingController searchWordController = TextEditingController();

  Widget _buildFloatingSearchBtn() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          setState(() {
            showTextField = !showTextField;
          });
        },
      ),
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: Center(
        child: TextField(
          controller: searchWordController,
          cursorColor: const Color(0xFFBBA68C8),
          decoration: const InputDecoration(
            hintText: "البحث ",
            hintStyle: TextStyle(color:Colors.white),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (search) {
            setState(() {
              searchWord = search;
            });
          },
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز الحضانة'),
        backgroundColor: Colors.purple[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
// <<<<<<< HEAD
//           Expanded(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: TextFormField(
//                   onChanged: (val){
//                     initiateSearch(val);
//                   },
//                   decoration: InputDecoration(
//                     prefixIcon: IconButton(
//                       color: Colors.white,
//                       icon: Icon(Icons.arrow_back),
//                       iconSize: 20,
//                       onPressed: (){
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     contentPadding: const EdgeInsets.all(10.0),
//                     hintText: 'ابحث عن حضانة',
//                     hintStyle: TextStyle(
//                       color: Colors.white,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
// =======
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0.0, 5.0, 0.0),
              child: SizedBox(
                width: showTextField ? 300 : 40,
                child: Row(
                  children: <Widget>[
                    showTextField ? _buildTextField() : Container(),
                    _buildFloatingSearchBtn(),
                  ],
                ),
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentTapTrackOrder(),
                  ));
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: CentersGrid(
        searchWord: searchWord,
      ),
    );
  }
}






