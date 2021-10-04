import 'package:flutter/material.dart';
import 'package:kidzone_app/providers/center.dart';

class Centers with ChangeNotifier {
  List<Centerss> _items = [
    Centerss(
        title: "حضانة المنال",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://static.wixstatic.com/media/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.jpg/v1/fill/w_640,h_352,al_t,q_80,usm_0.66_1.00_0.01/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.webp"),
    Centerss(
        title: "kidsCare",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://static.wixstatic.com/media/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.jpg/v1/fill/w_640,h_352,al_t,q_80,usm_0.66_1.00_0.01/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.webp"),
    Centerss(
        title: "حضانة المنال",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://static.wixstatic.com/media/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.jpg/v1/fill/w_640,h_352,al_t,q_80,usm_0.66_1.00_0.01/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.webp"),
    Centerss(
        title: "حضانة المنال",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://static.wixstatic.com/media/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.jpg/v1/fill/w_640,h_352,al_t,q_80,usm_0.66_1.00_0.01/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.webp"),
    Centerss(
        title: "حضانة المنال",
        description: "جدة حي الصفا",
        price: 450,
        imageUrl:
            "https://static.wixstatic.com/media/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.jpg/v1/fill/w_640,h_352,al_t,q_80,usm_0.66_1.00_0.01/0baadd_7bdcbc987d26467490d7fb0deb1d8095~mv2.webp"),
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
