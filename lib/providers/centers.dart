import 'package:flutter/material.dart';
import 'package:kidzone_app/providers/center.dart';

class Centers with ChangeNotifier {
  List<Centerss> _items = [
    Centerss(
        title: "حضانة عناق الدببة",
        description: "جدة حي الصفا",
        price: 450,
        imageAssets:
            "assets/images/bear hugs nursery.jpeg"),
    Centerss(
        title: "حضانة اليوم الرائع",
        description: "جدة حي الصفا",
        price: 450,
        imageAssets:
        "assets/images/wonderful day.jpeg"),
    Centerss(
        title: "حضانة قطار الصغار",
        description: "جدة حي الصفا",
        price: 450,
        imageAssets:
        "assets/images/kids train.jpeg"),

    ];

  List<Centerss> get items {
    return _items;

  }
Centerss findByTitle(String title){
    return _items.firstWhere((cent) => cent.title == title);
}
  void addCenter() {
    //_items.add(value);
    notifyListeners();

  }
}
