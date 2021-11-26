import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إستعادة كلمة المرور "),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "البريد الإلكتروني",
                  hintText: "البريد الإلكتروني",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.purple[300],
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "إستعادة كلمة المرور",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(
        msg: "الإيميل غير صحيح",
        backgroundColor: Colors.purple[300],
        textColor: Colors.black,
        fontSize: 20.0,
      );
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
      msg: "تم إرسال رابط إعادة تعيين كلمة المرور على بريدك الإلكتروني.",
      backgroundColor: Colors.purple[300],
      textColor: Colors.black,
      fontSize: 20.0,
    );
    Navigator.pop(context);
  }
}
