import 'package:flutter/material.dart';

import '../../utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String userID;
  final String image_url;
  final String username;
  final String message;
  final DateTime createdAt;

  const Message({
    @required this.userID,
    @required this.image_url,
    @required  this.username,
    @required this.message,
    @required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
    userID: json['userID'],
    image_url: json['image_url'],
    username: json['username'],
    message: json['message'],
    createdAt: Utils.toDateTime(json['createdAt']),
  );

  Map<String, dynamic> toJson() => {
    'idUser': userID,
    'urlAvatar': image_url,
    'username': username,
    'message': message,
    'createdAt': Utils.fromDateTimeToJson(createdAt),
  };
}
