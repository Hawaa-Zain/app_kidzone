import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'center_details.dart';
import 'centers_screen.dart';


User? user = FirebaseAuth.instance.currentUser;
TextEditingController birthDateController = TextEditingController();
TextEditingController  dateBookingController = TextEditingController();
TextEditingController  startTimeBookingController = TextEditingController();
TextEditingController endTimeBookingController = TextEditingController();

class KidsRegisterScreen extends StatefulWidget {
  final cenDoc;
  KidsRegisterScreen(this.cenDoc);


  @override
  State<KidsRegisterScreen> createState() => _KidsRegisterScreen();
}

class _KidsRegisterScreen extends State<KidsRegisterScreen> {

  late String? _name;
  late String? _gender;
  late String? _phoneNumber;
  late String? _registrationType;
  late bool _checkReg;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool validateAndSave() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        // التحقق من الفورم
       form.save();
        return true;
      }
      return false;
    }

    void validateAndSubmit() async {
      if(validateAndSave()){
        try{
          final docID = FirebaseFirestore.instance.collection('Parent').doc(user!.uid).collection("Children").doc().id;
          FirebaseFirestore.instance.collection('Parent').doc(user!.uid).collection("Children").doc(docID).set({
            "name": _name,
            "gender": _gender,
            "birthDate": birthDateController.text,
            "phoneNumber": _phoneNumber,
            "registrationType": _registrationType,
            "dateBooking": dateBookingController.text,
            "startTimeBooking": startTimeBookingController.text,
            "endTimeBooking": endTimeBookingController.text,
            "childID": docID,
            "checkReg": 'waiting',
          });
          FirebaseFirestore.instance.collection('Centers').doc(widget.cenDoc["userID"]).collection('Registration').doc(docID).set(
              {
                "name": _name,
                "gender": _gender,
                "birthDate": birthDateController.text,
                "phoneNumber": _phoneNumber,
                "registrationType": _registrationType,
                "dateBooking": dateBookingController.text,
                "startTimeBooking": startTimeBookingController.text,
                "endTimeBooking": endTimeBookingController.text,
                "childID": docID,
                "checkReg": 'waiting',
                "centerID": widget.cenDoc["userID"],
                "centerName": widget.cenDoc["name"],
                "centerEmail": widget.cenDoc["email"],

              });
          Fluttertoast.showToast(
            msg: "تم التسجيل بنجاح",
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 20.0,
          );
          var router = MaterialPageRoute(
              builder: (BuildContext context) => CentersScreen());
          Navigator.of(context).push(router);
        } catch (e) {
      print('Error: $e');
      }
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60)),
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
                              " التسجيل في الحضانة",
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return ' اسم الطفل مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _name = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "اسم الطفل الثلاثي",
                        labelStyle:
                        TextStyle(fontSize: 15, color: Colors.purple.shade300),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon:
                        Icon(Icons.person_outlined, color: Colors.purple
                            .shade300),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),

                      ),

                      value: 'جنس الطفل',
                      icon: const Icon(
                          Icons.arrow_drop_down, color: Colors.purple),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.purple, fontSize: 15,),
                      onChanged: (String? newValue) {
                        setState(() {
                          _gender = newValue;
                        });
                      },
                      items: ['جنس الطفل', 'ولد', 'بنت']
                          .map<DropdownMenuItem<String>>(
                              (String _value) {
                            return DropdownMenuItem<String>(
                              value: _value,
                              child: Center(child: Text(_value)),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: birthDateController,
                      decoration: InputDecoration(
                        hintText: "يوم/شهر/سنة",
                        labelText: "تاريخ ميلاد الطفل",
                        labelStyle:
                        TextStyle(fontSize: 15, color: Colors.purple.shade300),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        suffixIcon: InkWell(
                            onTap: () {
                              _showBirthDatePicker();
                            },
                            child: Icon(Icons.calendar_today_outlined,
                                color: Colors.purple.shade300)),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return ' رقم ولي الامر مطلوب';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _phoneNumber = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "رقم ولي أمر الطفل",
                        labelStyle:
                        TextStyle(fontSize: 15, color: Colors.purple.shade300),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(
                            Icons.phone, color: Colors.purple.shade300),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "التسجيل",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                      ),

                      value: 'التسجيل',
                      icon: const Icon(
                          Icons.arrow_drop_down, color: Colors.purple),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.purple, fontSize: 15),
                      onChanged: (String? newValue) {
                        setState(() {
                          _registrationType = newValue;
                        });
                      },
                      items: ['التسجيل', 'ساعات معينة', 'يوم', 'شهر', 'فصل دراسي']
                          .map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(child: Text(value)),
                            );
                          }).toList(),
                    ),

                    SizedBox(height: 10),
                    Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 250,
                              width: 450,
                              child: Card(
                                margin: EdgeInsets.all(0.2),
                                elevation: 8,
                                shadowColor: Colors.black.withAlpha(30),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.purple,
                                      width: 1),
                                ),
                                child: Column(
                                    children: [
                                      Text("   * اذا قمت باختيار( ساعات معينة / "
                                          "يوم )"
                                          "  الرجاء اختيار الوقت و التاريخ",
                                        style: const TextStyle(
                                          height: 3,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                        ),),
                                      SizedBox(height: 10),
                                      Row(
                                          children:[
                                            Text('  تاريخ الحجز :  ',
                                              style:TextStyle(fontSize: 14.5,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              width:200,
                                              child:TextFormField(
                                                controller: dateBookingController,
                                                decoration: InputDecoration(
                                                  hintText: "",
                                                  labelStyle:
                                                  TextStyle(fontSize: 15, color: Colors.purple.shade300),
                                                  border: OutlineInputBorder(),
                                                  contentPadding: EdgeInsets
                                                      .all(8),
                                                  suffixIcon: InkWell(

                                                      onTap: () {
                                                        _showDateBookingPicker();

                                                      },
                                                      child: Icon(
                                                        Icons.calendar_today_outlined,
                                                          color: Colors.black,
                                                      size: 20,)
                                                  ),
                                                ),),
                                            ),]),
                                      SizedBox(height: 10),
                                      Row(
                                          children:[
                                            Text(' وقت دخول الطفل:   ',
                                                style:TextStyle(fontSize: 14.5,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              width:150,
                                              child:TextFormField(
                                                controller: startTimeBookingController,
                                                decoration: InputDecoration(
                                                  hintText: "",
                                                  labelStyle:
                                                  TextStyle(fontSize: 15, color: Colors.purple.shade300),
                                                  border: OutlineInputBorder(),
                                                  contentPadding: EdgeInsets
                                                      .all(8),
                                                  suffixIcon: InkWell(

                                                      onTap: () {
                                                        _showStartTimeBooking(context);

                                                      },
                                                      child: Icon(
                                                        Icons.timer,
                                                        color: Colors.black,
                                                        size: 20,)
                                                  ),
                                                ),),
                                            ),]),
                                      SizedBox(height: 10),
                                      Row(
                                          children:[
                                            Text(' وقت خروج الطفل:   ',
                                                style:TextStyle(fontSize: 14.5,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                              width:150,
                                              child:TextFormField(
                                                controller: endTimeBookingController,
                                                decoration: InputDecoration(
                                                  hintText: "",
                                                  labelStyle:
                                                  TextStyle(fontSize: 15, color: Colors.purple.shade300),
                                                  border: OutlineInputBorder(),
                                                  contentPadding: EdgeInsets
                                                      .all(8),
                                                  suffixIcon: InkWell(

                                                      onTap: () {
                                                        _showEndTimeBooking(context);

                                                      },
                                                      child: Icon(
                                                        Icons.timer,
                                                        color: Colors.black,
                                                        size: 20,)
                                                  ),
                                                ),),
                                            ),]),

                                    ]),),),
                          ),

                        ]),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              validateAndSubmit();
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 6.5, horizontal: 80),
                            color: Colors.purple.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Text(
                              'إرسال طلب',
                              style: TextStyle(
                                color: Colors.white,),),
                          ),],
                      ),
                    ),]
                  ),
                ),
              ]),
            )
        )
    );
  }


  void _showBirthDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2030, 12),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.purple.shade300,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        }).then((selectedDate) {
      //TODO: handle selected date
      if (selectedDate != null) {
        final f = new DateFormat('yyyy/MM/dd ');
        birthDateController.text = f.format(selectedDate).toString();
      }
    });
  }
  void _showDateBookingPicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2030, 12),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.purple.shade300,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        }).then((selectedDateBooking) {
      //TODO: handle selected date
      if (selectedDateBooking != null) {
        final f = new DateFormat('yyyy/MM/dd ');
        dateBookingController.text = f.format(selectedDateBooking).toString();
      }
    });
  }

  void _showStartTimeBooking(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context,picker){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: picker!,
          );
        }
    ).then((time) {
      if (time != null) {
        startTimeBookingController.text = (time.format(context,)).toString();
      }
    });
  }
  void _showEndTimeBooking(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context,picker){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: picker!,
          );
        }
    ).then((time) {
      if (time != null) {
        endTimeBookingController.text = (time.format(context,)).toString();
      }
    });
  }
}


