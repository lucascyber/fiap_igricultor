import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Color backgroundColor;
  final String message;

  const ChatMessage({
    Key? key,
    required this.backgroundColor,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(message),
    );
  }
}
