import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Parent/splash_screen.dart';

void main() => runApp(RegisterScreen());

class RegisterScreen extends StatelessWidget {
  get image => null;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('التسجيل في الحضانة '),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
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
            TextField(
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
      );
}
