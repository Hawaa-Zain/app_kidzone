import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/splash_screen.dart';

void main() => runApp(RegisterScreen());

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
        Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70)
          ),
          color: new Color(0xFFFFFFFF),
          gradient: LinearGradient(
            colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "التسجيل في الحضانة ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
      ),
     Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "اسم الطفل الثلاثي...",
              labelText: "الإسم:",
              labelStyle:
              TextStyle(fontSize: 15, color: Colors.purple.shade300),
              border: OutlineInputBorder(),
              prefixIcon:
              Icon(Icons.child_care, color: Colors.purple.shade300),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "شهر/سنة...",
              labelText: "العمر:",
              labelStyle:
              TextStyle(fontSize: 25, color: Colors.purple.shade300),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.date_range_outlined,
                  color: Colors.purple.shade300),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "رقم ولي أمر الطفل",
              labelText: "التواصل:",
              labelStyle:
              TextStyle(fontSize: 15, color: Colors.purple.shade300),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone, color: Colors.purple.shade300),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: " ساعة/يومي/شهر/ترم؟.....",
              labelText: "التسجيل:",
              labelStyle:
              TextStyle(fontSize: 15, color: Colors.purple.shade300),
              border: OutlineInputBorder(),
              prefixIcon:
              Icon(Icons.app_registration, color: Colors.purple.shade300),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    'إرسال طلب',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ])));
  }
}
