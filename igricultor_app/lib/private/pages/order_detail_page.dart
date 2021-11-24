import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/private/widgets/payment_checkout_card.dart';
import 'package:igricultor_app/private/widgets/product_checkout_card.dart';
import 'package:igricultor_app/private/widgets/tracking_card.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Product product = Product(
      id: 1,
      name: 'Maçãs',
      price: 'R\$ 20,00',
      weight: '20kg',
      rating: 5,
      shipping: 'R\$ 17,00',
      harvest: '24/11/2021',
      type: 'type',
      image: 'image',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('#87451656'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Container(
        color: Colors.grey.shade200,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo do pedido',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ProductCheckOutCard(product: product),
            const SizedBox(height: 25),
            const Text(
              'Pagamento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const PaymentCheckoutCard(),
            const SizedBox(height: 10),
            const Text(
              'Rastreio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const TrackingCard(),
          ],
        ),
      ),
    );
  }
}
