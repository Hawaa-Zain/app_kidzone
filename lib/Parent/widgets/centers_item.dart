import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kidzone_app/Parent/center_details.dart';
import 'package:kidzone_app/Parent/comments.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

User? user = FirebaseAuth.instance.currentUser;

class CentersItem extends StatefulWidget {
  final cendoc;

  CentersItem(
    this.cendoc,
  );

  @override
  State<CentersItem> createState() => _CentersItemState();
}

class _CentersItemState extends State<CentersItem> {
  double rating = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  User? userAu = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //final center =  Provider.of<Centerss>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CenterDetails(widget.cendoc)),
            );
          },
          child: Image.network(
            widget.cendoc["image_url"],
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
              icon: Icon(Icons.add_comment_outlined,
                  color: Colors.white, size: 20),
              onPressed: () {
                bool isReq = true;
                displayComments(context,
                    centerID: widget.cendoc["userID"],
                    userId: user!.uid,
                    centerUrl: widget.cendoc["image_url"],
                    isReq: isReq);
              }),
          backgroundColor: Colors.purple.shade300,
          title: Text(
            widget.cendoc["name"],
            textAlign: TextAlign.center,
          ),
          trailing: GestureDetector(
            child: FutureBuilder<bool>(
              future: rateEvent(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == false) {
                  return SmoothStarRating(
                    rating: widget.cendoc["ratings"],
                    //document.data()['ratings'],
                    //the current
                    isReadOnly: false,
                    size: 22,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: false,
                    spacing: 2.0,
                    onRated: (value) async {
                      setState(() {
                        var stars = value.toString();
                        if (stars != null) {
                          CollectionReference centers =
                              FirebaseFirestore.instance.collection('Centers');
                          CollectionReference ratings = centers
                              .doc(widget.cendoc["userID"])
                              .collection('center_ratings');
                          ratings.doc(userAu!.uid).set({
                            'userId': userAu!.uid,
                            'centerID': widget.cendoc['userID'],
                            'stars': stars,
                            'isSubmitted': 'yes',
                          });
                        }
                      });
                      rating = await calculateAvg(widget.cendoc);
                      print("rating value dddd -> $rating");
                    },
                  );
                } else {
                  return SmoothStarRating(
                    rating: widget.cendoc["ratings"],
                    //document.data()['ratings'],
                    //the current
                    isReadOnly: true,
                    size: 22,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: false,
                    spacing: 2.0,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> rateEvent() async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance
          .collection("Centers")
          .doc(widget.cendoc["userID"])
          .collection("center_ratings")
          .doc(userAu!.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          print("issExists>>>${doc.exists}");
          exists = true;
        } else {
          print("issNotExists>>>${doc.exists}");
          exists = false;
        }
      });
    } catch (e) {
      //return false;
    }
    return exists;
  }

  Future<double> calculateAvg(QueryDocumentSnapshot document) async {
    var counter = 0;
    var star = 0.0;
    await FirebaseFirestore.instance
        .collection('Centers')
        .doc(document["userID"])
        .collection('center_ratings')
        .where('centerID', isEqualTo: document["userID"])
        .get()
        .then((QuerySnapshot querySnapshot) async {
      querySnapshot.docs.forEach((doc) {
        if (doc['stars'] != null) {
          star += double.parse(doc['stars']);
          counter = counter + 1;
          print('this is starsssssss $star');
          print(doc["stars"]);
        }
      });
    }).catchError(
      (err) => throw err,
    );
    print('this is th counter $counter and stars $star');
    double average = star / counter;
    await FirebaseFirestore.instance
        .collection('Centers')
        .doc(document["userID"])
        .update({'ratings': average});
    print('inside calculateAva avg is: $average');
    return average;
  }


  displayComments(context, {centerID, userId, centerUrl, isReq}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CommentsPage(
          centerID: centerID,
          userId: userId,
          centerUrl: centerUrl,
          isReq: isReq);
    }));
  }

  //setState(Null Function() param0) {}
}

