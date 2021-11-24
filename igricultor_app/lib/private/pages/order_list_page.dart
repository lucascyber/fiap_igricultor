import 'package:flutter/material.dart';
import 'package:igricultor_app/private/widgets/order_list_card.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final List<OrderList> orders = [
    OrderList(
      number: '6568984231',
      date: '24/11/2021',
      status: 'Em trânsito',
      total: 'R\$ 320,00',
      payment: 'Cartão de crédito',
    ),
    OrderList(
      number: '7897987544',
      date: '24/11/2021',
      status: 'Cancelado',
      total: 'R\$ 650,00',
      payment: 'Cartão de crédito',
    ),
    OrderList(
      number: '77789956',
      date: '27/11/2021',
      status: 'Entregue',
      total: 'R\$ 150,00',
      payment: 'Cartão de crédito',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
        backgroundColor: Colors.green.shade700,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: orders.length,
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
                '/order-detail',
              ),
              child: OrderListCard(
                order: orders[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OrderList {
  final String number;
  final String date;
  final String status;
  final String total;
  final String payment;

  OrderList({
    required this.number,
    required this.date,
    required this.status,
    required this.total,
    required this.payment,
  });
}
