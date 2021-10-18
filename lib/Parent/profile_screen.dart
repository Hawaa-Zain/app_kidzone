import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      title: Text(' الصفحة الشخصية'),
    ),
    body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.person_outlined,
                      color: Colors.purple[300],
                    ),
                    title: Text(' الإسم'),
                    trailing: Icon(Icons.keyboard_arrow_left),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.purple[300],
                    ),
                    title: Text('البريد الإلكتروني'),
                    trailing: Icon(Icons.keyboard_arrow_left),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.purple[300],
                    ),
                    title: Text(' رقم الجوال'),
                    trailing: Icon(Icons.keyboard_arrow_left),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.purple[300],
                    ),
                    title: Text('تغيير كلمة المرور'),
                    trailing: Icon(Icons.keyboard_arrow_left),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Colors.purple[300],
                    ),
                    title: Text(' تسجيل خروج  '),
                    onTap: () {},
                  ),
                ])),
          ]),
    ),
  );
}

