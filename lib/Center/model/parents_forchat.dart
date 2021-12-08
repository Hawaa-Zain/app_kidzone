// import 'package:meta/meta.dart';
//
// import '../../utils.dart';
//
//
// class ParentField {
//   static final String lastMessageTime = 'lastMessageTime';
// }
//
// class ParentUser {
//   final String userID;
//   final String name;
//   final String image_url;
//   final DateTime lastMessageTime;
//
//   const ParentUser({
//     @required this.userID,
//     @required this.name,
//     @required this.image_url,
//     @required this.lastMessageTime,
//   });
//
//   ParentUser copyWith({
//     String userID,
//     String name,
//     String image_url,
//     DateTime lastMessageTime,
//   }) =>
//       ParentUser(
//         userID: userID ?? this.userID,
//         name: name ?? this.name,
//         image_url: image_url ?? this.image_url,
//         lastMessageTime: lastMessageTime?? this.lastMessageTime,
//       );
//
//   static ParentUser fromJson(Map<String, dynamic> json) => ParentUser(
//     userID: json['userID'],
//     name: json['name'],
//     image_url: json['image_url'],
//     lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
//   );
//
//   Map<String, dynamic> toJson() => {
//     'userID': userID,
//     'name': name,
//     'image_url': image_url,
//     'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
//   };
// }
