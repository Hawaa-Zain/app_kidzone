import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as tAgo;

// to get the timestamp
final DateTime timestamp = DateTime.now();
final userReference =
FirebaseFirestore.instance.collection('Parent').snapshots();
User gCurrentUser = FirebaseAuth.instance.currentUser;
//var voluntaryID = "vaateam2020@gmail.com";

//User? currentUser;

class CommentsPage extends StatefulWidget {
  final String centerID;
  final String userId;
  final String centerUrl;
  final bool isReq;
  const CommentsPage(
      { Key key,
        @required this.centerID,
        @required this.userId,
        @required this.centerUrl,
        @required this.isReq, })
      : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState(
      centerID: centerID, userId: userId, centerUrl: centerUrl, isReq: isReq);
}

class _CommentsPageState extends State<CommentsPage> {
  final String centerID;
  final String userId; //postOwnerId
  final String centerUrl;
  final bool isReq;
  TextEditingController commentTextEditingController = TextEditingController();

  _CommentsPageState({@required this.centerID,
    @required this.userId,
    @required this.centerUrl,
    @required this.isReq});

  //return the comments by timestamp order and send them to Comment class
  retrieveComments() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Centers')
            .doc(centerID)
            .collection('centerComments')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, dataSnapshot) {
          if (!dataSnapshot.hasData) {
            return SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                ),
              ),
            );
          }
          List<Comment> comments = [];
          dataSnapshot.data.docs.forEach((document)
          {
            comments.add(Comment.fromDocument(document));
          });
          return ListView(
            children: comments,
          );
        });
  }

  //this function is to save the comments in firebase
  saveComment() async {
    //User currentUser = FirebaseAuth.instance.currentUser;
     String url;
     String userName;
     String user_id;
    await FirebaseFirestore.instance
        .collection('Parent')
        .where('userID', isEqualTo: userId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        userName = doc['name'];
        print(doc['name']);
        url = doc['image_url'];
        user_id = doc['userID'];
      });
    });

    await FirebaseFirestore.instance
        .collection('Centers')
        .doc(centerID)
        .collection('centerComments')
        .add({
      'userName': userName,
      'comment': commentTextEditingController.text,
      // I use here the final timestamp which return the current time.
      'timestamp': DateTime.now(),
      'url': url,
      'userId': user_id,
    });
    bool isNotPostOwner = userId != gCurrentUser.uid;
    if (isNotPostOwner) {
      FirebaseFirestore.instance
          .collection('Centers')
          .doc(centerID)
          .collection('feedItems')
          .add({
        'userName': userName,
        'commentDate': timestamp,
        'centerID': centerID,
        'userId': user_id,
        'userUrl': url, //userProfileImg
        'url': centerUrl,
      });
    }
    commentTextEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(' التعليقات '),
          backgroundColor: Colors.purple[300],
        ),
        body: Column(
          children: [
            Expanded(
              child: retrieveComments(),
            ),
            Divider(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: commentTextEditingController,
                  decoration: InputDecoration(
                    labelText: 'اترك تعليقًا هنا...',
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: OutlineButton(
                onPressed: saveComment,
                borderSide: BorderSide.none,
                child: Text(
                  'نشر',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//in this class we retrieve the data from the firebase and display them..
class Comment extends StatelessWidget {
  final String userName;
  final String userId;
  final String url;
  final String comment;
  final Timestamp timestamp;

  const Comment(
      { Key key,
        @required this.userName,
        @required this.userId,
        @required this.comment,
        @required this.timestamp,
        @required this.url})
      : super(key: key);
  factory Comment.fromDocument(DocumentSnapshot documentSnapshot) {
    return Comment(
      userName: documentSnapshot['userName'],
      userId: documentSnapshot['userId'],
      url: documentSnapshot['url'],
      comment: documentSnapshot['comment'],
      timestamp: documentSnapshot['timestamp'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  userName + ": " + comment,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(url),
                ),
                subtitle: Text(
                  tAgo.format(timestamp.toDate()),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
