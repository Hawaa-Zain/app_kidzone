import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/register_screen.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';

class CentersDetailScreen extends StatelessWidget {
  //late final String title;
  // CentersDetailScreen(this.title);
  static String routName = '/centers-detail';
  String read =' تستقبل الحضانة الأطفال من عمر ثلاث أشهر إلى ست سنوات ولديهم باقات تشمل رعاية نهارية فقط ,وباقات تشمل رعاية نهارية بالإضافة إلى الأكل وتغيير الحفاضات ,وباقة العناية تشمل رعاية نهارية بالإضافة إلى الأكل وتغيير الحفاضات ومراقبة الطفل في أي وقت وايضا رعاية مسائية خلال عطلات نهاية الأسبوع. ';
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
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              child: Text(read,
              style: TextStyle(
                color: Colors.purple.shade500,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text("موقع الحضانة: جدة حي الزهراء",
            style: TextStyle(
              color: Colors.purple.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),),
          ),
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomCenter,
        child: Text("للتواصل والإستفسار على الرقم: 0544699331",
          style: TextStyle(
            color: Colors.purple.shade500,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
          SizedBox(height: 20),
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
