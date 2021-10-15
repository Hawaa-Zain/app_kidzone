import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/centers_details_screen.dart';
import 'package:kidzone_app/widgets/centers_grid.dart';

class CentersScreen extends StatefulWidget {

  @override
  CentersScreenState createState() =>CentersScreenState();
}

class CentersScreenState extends State<CentersScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      title: Text('مراكز الحضانة'),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },


              ),
      ],
    ),
      body: CentersGrid(),
  );
  }
class DataSearch extends SearchDelegate<String>{
  final centers=[
    'حضانة المنال',
    'kidsCare' ,
    'حضانة المنال',
    'حضانة المنال',
    'حضانة المنال',
  ];
  final recentCenters = [
    'حضانة المنال',
    'kidsCare' ,
    'حضانة المنال',
    'حضانة المنال',
    'حضانة المنال',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=> CentersDetailScreen()),
        );
      },

        icon: Icon(Icons.clear),
    ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }


  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.purple.shade300,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );


  }

  @override
  Widget buildSuggestions(BuildContext context) {

final suggestionList = query.isEmpty ? recentCenters
    : centers.where((p)=>p.startsWith(query)).toList();
return ListView.builder(

  itemBuilder: (context, index) => ListTile(

    leading: Icon(Icons.help_center),
    title: RichText(
      text: TextSpan(
        text: suggestionList[index].substring(0, query.length),
        style: TextStyle(
          color: Colors.black,
              fontWeight: FontWeight.bold),

        children: [
          TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(
              color: Colors.grey
            ),

          ),
        ],
      ),

    ),

  ),
  itemCount: suggestionList.length,
);
  }

}






