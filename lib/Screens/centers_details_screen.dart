import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/register_screen.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';

class CentersDetailScreen extends StatelessWidget {
  //late final String title;
  // CentersDetailScreen(this.title);
  static String routName = '/centers-detail';

  @override
  Widget build(BuildContext context) {
    final centersTitle = ModalRoute.of(context)!.settings.arguments as String;
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
            child: Image.network(
              loadedCenter.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text("معلومات الإتصال"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text(
              "التقييم",
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text("الموقع"),
          ),
            SizedBox(height: 20),
            Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  RaisedButton(
                  onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> RegisterScreen()),
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
