import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/centers_details_screen.dart';

class CentersItem extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  CentersItem(
      this.title,
      this.description,
      this.price,
      this.imageUrl,);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(CentersDetailScreen.routName,arguments: title,
            );

          },
        child: Image.network(imageUrl,
       fit: BoxFit.cover,),
        ),
        footer: GridTileBar(
        backgroundColor: Colors.purple.shade300,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    ),
    );
  }
}
