import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Centerss with ChangeNotifier{
  final String title;
  final String description;
  final int price;
  final String imageAssets;

  Centerss({
     this.title,
     this.description,
     this.price,
     this.imageAssets,
  });


  findByTitle(String centerTitle) {}
}
