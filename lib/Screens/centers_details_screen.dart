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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ));
              // Write Click Listener Code Here.
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, top: 78),
              padding: EdgeInsets.only(left: 30, right: 30),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(new Color(0xFF9575CD)), new Color(0xFF9575CD)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Text(
                "التسجيل",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
