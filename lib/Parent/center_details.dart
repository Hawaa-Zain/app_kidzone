import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/kids_register_screen.dart';


class CenterDetails extends StatefulWidget {
  final cendoc;
  CenterDetails(this.cendoc);
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
                  title: Text('معلومــات الحـضـانة',
                      style:TextStyle(
                        color:Colors.purple[300],
                        fontSize: 23,
                        fontWeight: FontWeight.bold,)),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                      children: <Widget>[
                        Column(
                            children: [
                              SizedBox(width: 5),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Icon(Icons.email, color: Colors.grey,size:
                                    25,),
                                    Text("  البـريـد الالكـتـروني", style:
                                    TextStyle(color:Colors.purple[300],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),),

                                    SizedBox(width: 90),
                                    Icon(Icons.phone, color: Colors.grey,size: 25,),
                                    Text(" رقم الاتصــال", style: TextStyle(color:Colors.purple[300],fontSize: 17,
                                        fontWeight: FontWeight.bold),),
                                  ]
                              ),
                              SizedBox(height: 5),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Text(widget.cendoc['email'], style:
                                    TextStyle(fontSize: 17,),),

                                    SizedBox(width: 36

                                    ),
                                    Text(widget.cendoc['phone'], style: TextStyle(fontSize:
                                    17,),),
                                  ]
                              ),
                              SizedBox(height:20),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Icon(Icons.child_care_outlined , color:
                                    Colors.grey,size: 25,),
                                    Text("  الفئـة العمريـة", style:
                                    TextStyle(color:Colors.purple[300],fontSize: 17,fontWeight: FontWeight.bold),),

                                    SizedBox(width: 110),
                                    Icon(Icons.attach_money_outlined, color: Colors.grey,size: 25,),
                                    Text(" الـسعـر", style: TextStyle
                                      (color:Colors.purple[300],fontSize: 17,
                                        fontWeight: FontWeight.bold),),
                                  ]
                              ),
                              SizedBox(height: 5),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Text(widget.cendoc['kidsAge'], style:
                                    TextStyle(fontSize: 17,)),

                                    SizedBox(width: 60),
                                    Text(widget.cendoc['price'], style: TextStyle
                                      (fontSize:
                                    17,),),
                                  ]
                              ),

                              SizedBox(height:15),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Icon(Icons.location_on , color: Colors.grey,size: 25,),
                                    Text("  الـحــي", style:
                                    TextStyle(color:Colors.purple[300],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),),

                                    SizedBox(width: 140),
                                    Icon(Icons.access_time, color: Colors.grey,size: 25,),
                                    Text(" سـاعـات الـعـمـل", style: TextStyle
                                      (color:Colors.purple[300],fontSize: 17,
                                        fontWeight: FontWeight.bold),),
                                  ]
                              ),
                              SizedBox(height: 5),
                              Row(
                                  children: <Widget>[
                                    SizedBox(width: 30),
                                    Text(widget.cendoc['address'], style:
                                    TextStyle(fontSize: 17,)),

                                    SizedBox(width: 120),
                                    Text(widget.cendoc['workingHours'], style: TextStyle
                                      (fontSize:
                                    17,),),
                                  ]
                              ),]
                        ),]
                  ),
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
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius:
                            BorderRadius.circular(20)),),
                          onPressed:() {
                            {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    KidsRegisterScreen(widget.cendoc)),
                              );}}
                      ),],
                  ),
                ),
              ],
            ),

          ),
          

        );}
    );
  }
}