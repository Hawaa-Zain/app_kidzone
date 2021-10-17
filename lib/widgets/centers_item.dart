import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/centers_details_screen.dart';
import 'package:kidzone_app/providers/center.dart';
import 'package:provider/provider.dart';

class CentersItem extends StatelessWidget {
 // final String title;
 // final String description;
 // final int price;
 // final String imageUrl;
 // CentersItem(
  //    this.title,
    //  this.description,
   //   this.price,
     // this.imageUrl,);
  @override
  Widget build(BuildContext context) {
   final center =  Provider.of<Centerss>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(CentersDetailScreen.routName,arguments: center.title,
            );

          },
        child: Image.asset(center.imageAssets,
       fit: BoxFit.cover,),
        ),
        footer: GridTileBar(
        backgroundColor: Colors.purple.shade300,
        title: Text(
          center.title,
          textAlign: TextAlign.center,
        ),
      ),
    ),
    );
  }
}
