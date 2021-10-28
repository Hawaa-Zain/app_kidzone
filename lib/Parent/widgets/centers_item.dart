import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kidzone_app/Parent/center_details.dart';
import 'package:kidzone_app/Parent/comments.dart';
import 'package:kidzone_app/providers/center.dart';
import 'package:provider/provider.dart';

class CentersItem extends StatelessWidget {
  double rating=0;
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
      borderRadius: BorderRadius.circular(40),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(CenterDetails.routName,arguments: center.title,

            );
          },
        child: Image.asset(center.imageAssets,
       fit: BoxFit.cover,),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.add_comment_outlined,color: Colors.white,
            size: 20),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Comments
                ()));
            },
          ),
        backgroundColor: Colors.purple.shade300,
        title: Text(
          center.title,
          textAlign: TextAlign.center,
        ),

          trailing: RatingBar.builder(
                maxRating: 1,
                  itemSize: 20,
                  itemBuilder: (context,_)=> Icon(Icons.star, color: Colors.yellow),
                  updateOnDrag: false,

                  onRatingUpdate: (rating)=> setState((){
                    this.rating=rating;

    }),

          ),

      ),
      ),
    );
    
  }

  setState(Null Function() param0) {}
}
