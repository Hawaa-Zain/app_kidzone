import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Centerss with ChangeNotifier{
  final String title;
  final String description;
  final int price;
  final String imageUrl;

  Centerss({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  findByTitle(String centerTitle) {}
}
