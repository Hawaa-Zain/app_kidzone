import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/kids_register_screen.dart';


class CenterDetails extends StatefulWidget {
  final cendoc;

  CenterDetails(this.cendoc);

  //late final String title;
  // CentersDetailScreen(this.title);
  static String routName = '/centers-detail';


  @override
  State<CenterDetails> createState() => _CenterDetailsState();
}

class _CenterDetailsState extends State<CenterDetails> {



  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {

    // //to check the status of the registration of the user
    // checkRegistration() async {
    //   //User currentUser = FirebaseAuth.instance.currentUser;
    //   String checkReg;
    //   await FirebaseFirestore.instance
    //       .collection('Parent')
    //       .doc(user!.uid)
    //   .collection("Children")
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       checkReg = doc['checkReg'];
    //
    //     });
    //   });
    // }

    // final centersTitle = ModalRoute
    //     .of(context)!
    //     .settings
    //     .arguments as String;
    // final loadedCenter = Provider.of<Centers>(
    //   context,
    //   listen: false,
    // ).findByTitle(centersTitle);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Centers")
            .where("userID",
            isEqualTo:
            widget.cendoc["name"])
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.cendoc["name"]),
            backgroundColor: Colors.purple[300],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 340,
                  width: double.infinity,
                  child: Image.network(
                    widget.cendoc["image_url"],
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text('معلومات الحضانة'),
                ),

                ListTile(
                  leading: Icon(Icons.email,
                  color: Colors.purple.shade300),

                ),
                ListTile(
                  leading: Icon(Icons.phone,
                      color: Colors.purple.shade300),


                ),
                ListTile(
                  leading: Icon(Icons.location_on,
                      color: Colors.purple.shade300),

                ),
                ListTile(
                  leading: Icon(Icons.access_time,
                      color: Colors.purple.shade300),

                ),
                ListTile(
                  leading: Icon(Icons.child_care_outlined ,
                      color: Colors.purple.shade300),
                ),
                ListTile(
                  leading:Icon(Icons.attach_money_outlined,
                      color: Colors.purple.shade300),

            ),

                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text("التسجيل"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 80),
                          onPrimary: Colors.white,
                          primary: Colors.purple[300],
                          onSurface: Colors.grey,
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius:
                          BorderRadius.circular(20)),
                        ),
                        onPressed:() {
                          {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  KidsRegisterScreen(widget.cendoc)),
                            );
                          }
                        }),
                      ],
                    ),

                  ),

                ],

              ),
          ),
          );
      }
    );
  }
}
