import 'package:cached_network_image/cached_network_image.dart';
import 'package:carrot_market/models/chat_message.dart';
import 'package:carrot_market/view/pages/main/chatting/components/chat_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("채팅"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            chatMessageList.length,
            (index) => ChatBody(
              chatMessage: chatMessageList[index],
            ),
          ),
        ],
      ),
    );
  }
}
