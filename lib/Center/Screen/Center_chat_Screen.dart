import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/Screen/Centers_Bottom_Taps_screen.dart';

class CenterChatScreens extends StatefulWidget {
  @override
  State<CenterChatScreens> createState() => _CenterChatScreens();
}

class _CenterChatScreens extends State<CenterChatScreens> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 8,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CentersBottomTapsScreens()
          ));

        },
      ),
      title: Text('المحادثات'),
      backgroundColor: Colors.purple[300],
    ),
    body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> Chat(
              sender: chat.sender,
            ))),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(40),
          ),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.65,
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(chat.sender,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                            Text( chat.time,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(chat.text,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          );
        }
    ),
  );
}

class Chat extends StatefulWidget {
  final  sender;
  Chat({this.sender});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children:[
              TextSpan(text:
              widget.sender,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(''),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.purple.shade300,
                        width: 0.2,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "أكتب الرسالة..."),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Colors.purple.shade300,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class Message{
  final String sender;
  final String time;
  final String text;
  final bool unread;
  final String imageUrl;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
    required this.imageUrl,
  });
}

List<Message> chats = [
  Message(
      sender: 'kidZone',
      time: '5:30 PM',
      text: ' هل تستقبلون الاطفال من عمر سنه فاكثر',
      unread: true,
      imageUrl: 'https://thumbs.dreamstime.com/b/white-flower-beautiful-hd-pic-japantown-215486907.jpg'

  ),
  Message(
      sender: 'WenderFul Center',
      time: '5:30 PM',
      text: ' هل تستقبلون الاطفال من عمر سنه فاكثر',
      unread: true,
      imageUrl: ''
  ),
  Message(
      sender: 'care',
      time: '5:30 PM',
      text: ' هل تستقبلون الاطفال من عمر سنه فاكثر',
      unread: true,
      imageUrl: 'https://thumbs.dreamstime.com/b/white-flower-beautiful-hd-pic-japantown-215486907.jpg'
  ),
];

List<Message> message = [
  Message(
      sender: 'مركز الكبار',
      time: '5:30 PM',
      text: ' هل تستقبلون الاطفال من عمر سنه فاكثر',
      unread: true,
      imageUrl: 'https://thumbs.dreamstime.com/b/white-flower-beautiful-hd-pic-japantown-215486907.jpg'

  ),
];