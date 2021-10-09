import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/login_screen.dart';
import 'package:kidzone_app/widgets/centers_grid.dart';

class CentersScreen extends StatefulWidget {

  @override
  CentersScreenState createState() =>CentersScreenState();
}

class CentersScreenState extends State<CentersScreen> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchCenters= Text('مراكز الحضانة');
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      title: customSearchCenters,
        actions: <Widget>[
          IconButton(onPressed: (){
            setState(() {
              if(this.customIcon.icon==Icons.search){

                this.customIcon= Icon(Icons.cancel);
                this.customSearchCenters = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'البحث عن المركز'
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                );
              }
              else {
                this.customIcon= Icon(Icons.search);
                this.customSearchCenters = Text('مراكز الحضانة');
              }
            });
          },
            icon: customIcon
              ),
      ],
    ),

      body: CentersGrid(
      ),

  );

  }
class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
}




// Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                       builder: (context) => CentersScreen(),
//                       ));




