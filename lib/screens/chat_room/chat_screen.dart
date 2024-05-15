import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/data/services/chat_services/chat_services.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/chat_screen_widget/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final String receiverUserPhone;
  final String receiverUserID;
  ChatPage(
      {super.key,
      required this.receiverUserPhone,
      required this.receiverUserID});
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sendMessage() async {
    print('this is inside of chat $receiverUserID');
    if (receiverUserID.isNotEmpty && messageController.text.isNotEmpty) {
      print('this is our receveir $receiverUserID');
      print(messageController.text);
      await chatService.sendMessage(receiverUserID, messageController.text);
      messageController.clear();
    } else {
      print('Error: receiverUserID is null or message is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          buildMessageInput(context)
        ],
      ),
    );
  }

  buildMessageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
        FirebaseDatastoring.shopid,
        receiverUserID,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  buildMessageInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Mymediaquery().mediaqueryheight(0.03, context)),
      child: Row(
        children: [
          Expanded(
            child: Inputfield(
              hinttext: 'Enter message',
              controller: messageController,
            ),
          ),
          IconButton(
              onPressed: sendMessage,
              icon: Icon(
                Icons.send,
                size: 30,
                color: Appallcolor().colorwhite,
              ))
        ],
      ),
    );
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == FirebaseDatastoring.shopid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        children: [
          // Text(data['sendEmail']),
          ChatBubble(
            message: data['message'],
          )
        ],
      ),
    );
  }
}
