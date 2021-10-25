import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/register_screen.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';

class CenterDetails extends StatefulWidget {
  //late final String title;
  // CentersDetailScreen(this.title);
  static String routName = '/centers-detail';

  @override
  State<CenterDetails> createState() => _CenterDetailsState();
}

class _CenterDetailsState extends State<CenterDetails> {

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }


  @override
  Widget build(BuildContext context) {
    final centersTitle = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    final loadedCenter = Provider.of<Centers>(
      context,
      listen: false,
    ).findByTitle(centersTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedCenter.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: Image.asset(
              loadedCenter.imageAssets,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'معلومات الحضانة'),
          buildListViewContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(""),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    ' التسجيل ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ),

        ],

      ),
    );
  }
}