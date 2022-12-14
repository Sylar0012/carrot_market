import 'package:cached_network_image/cached_network_image.dart';
import 'package:carrot_market/models/chat_message.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatBody({required this.chatMessage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CachedNetworkImage(
                  imageUrl: chatMessage.profileImage,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: chatMessage.sender,
                            style: textTheme().bodyText1,
                          ),
                          TextSpan(
                            text: "${chatMessage.location}ㆍ${chatMessage.sendDate}",
                            style: textTheme().subtitle2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      chatMessage.message,
                      style: textTheme().bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: chatMessage.imageUri != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      chatMessage.imageUri ?? '',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
