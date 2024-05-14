import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Appallcolor().listcontainer),
        child: Text(
          message,
          style: TextStyle(fontSize: 17, color: Appallcolor().colorwhite),
        ),
      ),
    );
  }
}
