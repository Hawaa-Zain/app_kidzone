import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService{
  searchByName(String searchField){
    return FirebaseFirestore.instance.collection('Centers').
    where('searchKey', isEqualTo: searchField.substring(0,1)).get();
  }
}