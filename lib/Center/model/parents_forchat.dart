import 'package:meta/meta.dart';

import '../../utils.dart';


class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class User {
  final String userID;
  final String name;
  final String image_url;
  final DateTime lastMessageTime;

  const User({
    @required this.userID,
    @required this.name,
    @required this.image_url,
    @required this.lastMessageTime,
  });

  User copyWith({
    String userID,
    String name,
    String image_url,
    DateTime lastMessageTime,
  }) =>
      User(
        userID: userID ?? this.userID,
        name: name ?? this.name,
        image_url: image_url ?? this.image_url,
        lastMessageTime: lastMessageTime?? this.lastMessageTime,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    userID: json['userID'],
    name: json['name'],
    image_url: json['image_url'],
    lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
  );

  Map<String, dynamic> toJson() => {
    'userID': userID,
    'name': name,
    'image_url': image_url,
    'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
  };
}
