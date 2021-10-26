import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class BabyData with ChangeNotifier {
  final DocumentReference reference;
  String name;

  BabyData({
    required this.reference,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
