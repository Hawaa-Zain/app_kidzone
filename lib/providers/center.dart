import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Centerss with ChangeNotifier{
  final String title;
  final String description;
  final int price;
  final String imageAssets;

  Centerss({
    required this.title,
    required this.description,
    required this.price,
    required this.imageAssets,
  });


  findByTitle(String centerTitle) {}
}
