import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/widgets/centers_item.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';

class CentersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final centersData = Provider.of<Centers>(context);
    //final centerss = centersData.items;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Centers")
            .where("state",
            isEqualTo:
            'Active')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
            final cendoc = snapshot.data!.docs[index];

            return CentersItem(cendoc);
            // itemCount: centerss.length,
              // itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              //value: centerss[i],
              //child: CentersItem(
              //Centerss[i].title,
              //Centerss[i].description,
              //Centerss[i].price,
              //Centerss[i].imageAssets,
              //       ),
              // ),
          } );
        }
    );
  }
}
