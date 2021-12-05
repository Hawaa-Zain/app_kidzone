import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Admin/widget_Admin/order_center.dart';
import 'package:kidzone_app/Parent/welcome_Screen.dart';


class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdmin createState() => _HomeAdmin();
}

class _HomeAdmin extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلبات مراكز الحضانة '),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[(new Color(0XFF9CCC65)), new Color(0XFFC5E1A5)])
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new_outlined),
            onPressed: () {_onLogOutPressed(context);},
          ),],
      ),
      body: OrderCenter(),

    );
  }
}
void _onLogOutPressed(BuildContext context){
  showModalBottomSheet(
      context:context,
      builder: (context){
        return  Container(
            height: 300,
            color:Colors.white,
            child: Column(
              children: <Widget> [
                SizedBox(height: 10),
                Text("تسجيل الخروج",
                  style: TextStyle(color:  (new Color(0XFF9CCC65)),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),),
                SizedBox(height: 8),
                Text(" هل أنت متأكد أنك تريد تسجيل الخروج ؟",
                  style: TextStyle(color: (new Color(0XFF9CCC65)),
                      fontSize: 15),),
                SizedBox(height: 13.5),
                GestureDetector(
                  onTap: () async {
                    // add then in SignOut..
                    await FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 100, right: 100,top: 20 ,
                        bottom: 40),
                    padding: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [(new Color(0XFF9CCC65)), new Color(0XFFC5E1A5)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: Text("نعم",
                      style: TextStyle(color: Colors.white, fontWeight:
                      FontWeight.bold, fontSize: 20),),
                  ),
                ),
                SizedBox(height: 0.5),
                Container(
                  margin: EdgeInsets.all(8),
                  child: TextButton(
                    child: Text('إلغاء الامر', style: TextStyle(color: Color(0XFF9CCC65), fontWeight:
                    FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeAdmin(),));
                    },
                  ),
                ),],
            )
        );
      });
}