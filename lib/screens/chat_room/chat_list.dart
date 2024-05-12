import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/services/chat_services/chat_services.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        title: Text('Chat List'),
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: StreamBuilder(
        stream: ChatService().getMessageList(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No chats available.'));
          } else {
            final chatRooms = snapshot.data!.docs;
            return ListView.builder(
              itemCount: chatRooms.length,
              itemBuilder: (context, index) {
                final chatRoom =
                    chatRooms[index].data() as Map<String, dynamic>;
                final senderId = chatRoom['senderId'];
                final message = chatRoom['message'];
                // Here you can build UI for each chat room
                return ListTile(
                  tileColor: Colors.amber,
                  title: Text('Sender: $senderId'),
                  subtitle: Text('Message: $message'),
                  onTap: () {
                    // Navigate to chat room when tapped
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
