// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/private/model/chat.dart';
import 'package:igricultor_app/private/widgets/chat_bottom_bar.dart';
import 'package:igricultor_app/private/widgets/chat_message.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<Chat> _messages = [
    Chat(
      message: 'Olá como posso te ajudar?',
      origin: 'receiver',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat com vendedor de ${product.name}'),
        backgroundColor: Colors.green.shade700,
      ),
      bottomNavigationBar: SafeArea(
        child: ChatBottomBar(
          onSend: (value) => setState(() {
            _messages.add(value);
          }),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView.builder(
          itemCount: _messages.length,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 10,
                bottom: 10,
              ),
              child: Align(
                alignment: _isReceiver(_messages[index])
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: ChatMessage(
                  message: _messages[index].message,
                  backgroundColor: _isReceiver(_messages[index])
                      ? Colors.grey.shade300
                      : Colors.green.shade200,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isReceiver(Chat message) => message.origin == 'receiver';
}
