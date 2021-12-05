import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidzone_app/Parent/model/center_user.dart';
import '../utils.dart';
import 'Center/model/message.dart';
import 'Center/model/parents_forchat.dart';



class FirebaseApi {
  static Stream<List<User>> getUsers() => FirebaseFirestore.instance
      .collection('Parent')
      //orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(User.fromJson));

  static Stream<List<Centers>> getCentersUsers() => FirebaseFirestore.instance
      .collection("Centers")
      //.orderBy(CenterField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Centers.fromJson));


  static Future uploadMessage(String userID, String message,) async {

    String username;
    String image_url;
    await FirebaseFirestore.instance
        .collection('Centers')
        .where('userID', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        username = doc['name'];
        print(doc['name']);
        image_url = doc['image_url'];
      });
    });

    final newMessage = Message(
      userID: userID,
      image_url: image_url,
      username: username,
      message: message,
      createdAt: DateTime.now(),
    );
    final refMessages =
    FirebaseFirestore.instance.collection('chats/${userID}/messages');
    refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('Parent');
    await refUsers
        .doc(userID)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<User> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(userID: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }
}