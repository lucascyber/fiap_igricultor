// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:igricultor_app/private/model/chat.dart';

class ChatBottomBar extends StatefulWidget {
  final Function(Chat) onSend;

  const ChatBottomBar({
    Key? key,
    required this.onSend,
  }) : super(key: key);

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: TextField(
              controller: textController,
              decoration: _inputDecoration(),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.green.shade700,
                size: 30,
              ),
              onPressed: () => _handleClick(),
            ),
          )
        ],
      ),
    );
  }

  void _handleClick() {
    if (textController.text.isNotEmpty) {
      widget.onSend(Chat(
        message: textController.text,
        origin: 'sender',
      ));
      textController.clear();
    }
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintText: 'Digite sua mensagem',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.green.shade700,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
