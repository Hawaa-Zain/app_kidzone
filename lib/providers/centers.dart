import 'package:flutter/material.dart';
import 'package:kidzone_app/providers/center.dart';

class Centers with ChangeNotifier {
  List<Centerss> _items = [
    Centerss(
        title: "Bear Hugs Nursery",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/cc120f95923657.5ea292cb65d2c.jpg"),
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
