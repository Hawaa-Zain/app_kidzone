import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



TextEditingController dateController = TextEditingController();


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
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
                    decoration: InputDecoration(
                      hintText: "اسم الطفل الثلاثي",
                      labelStyle:
                      TextStyle(fontSize: 15, color: Colors.purple.shade300),
                      border: OutlineInputBorder(),
                      prefixIcon:
                      Icon(Icons.group_outlined, color: Colors.purple.shade300),
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
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: "يوم/شهر/سنة",
                      labelText: "العمر",
                      labelStyle:
                      TextStyle(fontSize: 15, color: Colors.purple.shade300),
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(

                          onTap: () {
                            _showDatePicker();
                          },
                          child: Icon(Icons.calendar_today_outlined,
                              color: Colors.purple.shade300)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "رقم ولي أمر الطفل",
                      labelStyle:
                      TextStyle(fontSize: 15, color: Colors.purple.shade300),
                      border: OutlineInputBorder(),
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

                  SizedBox(height: 100),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            _showDatePicker();
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


  void _showDatePicker() {
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
        dateController.text = f.format(selectedDate).toString();
      }
    });
  }


}

