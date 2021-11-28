import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidzone_app/Parent/parent_login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20, top: 50),
                        alignment: Alignment.center,
                        child: Text(
                          "  تغيير كلمة المرور ",
                          style: TextStyle(fontSize: 30, color: Colors
                              .purple[300],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 80,),
                      Padding(
                          padding:EdgeInsets.all(15),
                          child: Column(children: [
                            Text("اعد إدخال البريد الإلكتروني الخاص بك للمتابعة",
                                style:TextStyle(fontSize: 15,
                                    color: Colors.purple[300],
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: TextFormField(
                                controller: editController,
                                cursorColor: Color(0xFFBBA68C8),
                                decoration: InputDecoration(
                                  hintText: "البريد الالكتروني ",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                resetPassword(context);

                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left:70,right:70, top: 50),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [(new Color(0xFFBBA68C8)), new Color(0xFFBBA68C8)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)),
                                  ],
                                ),
                                child: Text(
                                  "تحديث",
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextButton(
                                child: Text('إلغاء الامر'),
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          ParentLoginScreen(),)

                                  );},
                              ),
                            ),
                          ])
                      ),],
                  )
              ),],
          ),
        )
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
      fontSize: 15.0,
    );
    Navigator.pop(context);
  }
}
