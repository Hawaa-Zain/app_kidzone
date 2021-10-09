import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/centers_screen.dart';
import 'package:kidzone_app/Screens/profile_screen.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:kidzone_app/widgets/centers_item.dart';
import 'package:provider/provider.dart';

class CentersGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final centersData = Provider.of<Centers>(context);
    final Centerss = centersData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: Centerss.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
      value: Centerss[i],
      child:CentersItem(
        //Centerss[i].title,
       // Centerss[i].description,
      //  Centerss[i].price,
       // Centerss[i].imageUrl,
      ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
