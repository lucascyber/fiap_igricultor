import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';

class ChatListCard extends StatelessWidget {
  final ChatUser user;
  const ChatListCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.lastMessage,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}

class ChatUser {
  final String name;
  final String image;
  final String lastMessage;

  ChatUser({
    required this.name,
    required this.image,
    required this.lastMessage,
  });
}
