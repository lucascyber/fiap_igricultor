import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/private/widgets/chat_list_card.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<ChatUser> _users = [
    ChatUser(
      name: 'João da Silva',
      image:
          'https://pbs.twimg.com/profile_images/1434399792/avatar2_400x400.png',
      lastMessage: 'Podemos fechar negócio?',
    ),
    ChatUser(
      name: 'Gonçalves Dias',
      image:
          'https://images.carreirabeauty.com/uploads/photo/s3_file/57053affb680d32603000491/hj0gxmjazrlj46tnybne.jpeg',
      lastMessage: 'Eu tenho 160kg',
    ),
    ChatUser(
      name: 'Rodrigo Santos',
      image:
          'https://ultrapop.com.br/wp-content/uploads/2020/07/1410345148939.jpg',
      lastMessage: 'Digitando...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Product product = Product(
      id: 1,
      name: 'Bananas',
      price: '',
      weight: '',
      rating: 3,
      shipping: '',
      harvest: '',
      type: '',
      image: '',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Negociações'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        itemCount: _users.length,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 10,
              bottom: 10,
            ),
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                '/chat-detail',
                arguments: product,
              ),
              child: ChatListCard(
                user: _users[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
