import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  String read = ' تستقبل الحضانة الأطفال من عمر ثلاث أشهر إلى ست سنوات رعاية نهارية بالإضافة إلى الأكل وتغيير الحفاضات ومراقبة الطفل في أي وقت وايضا رعاية مسائية خلال عطلات نهاية الأسبوع. ';
  double rating = 0;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('تقييم الحضانة',
                style: TextStyle(fontSize: 25,
                    color: Colors.purple.shade300),
              ),
              Center(
                child: RatingBar.builder(
                  maxRating: 1,
                  itemBuilder: (context, _)=> Icon(Icons.star,color: Colors.yellow),
                  onRatingUpdate: (rating)=> setState(() {
                    this.rating=rating;
                  },
                  ),
                ),
              ),
            ],
          ),
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

  void showRating() => showDialog(context: context,
    builder: (context)=> AlertDialog(
      title: Text('Rate This App'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('please leave a star rating',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
      actions: [
        TextButton(onPressed: ()=> Navigator.pop,
          child: Text(
            'Ok',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
setState(Null Function() param0) {
}