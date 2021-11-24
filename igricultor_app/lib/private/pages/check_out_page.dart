import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/private/widgets/chekout_bottom_bar.dart';
import 'package:igricultor_app/private/widgets/payment_checkout_card.dart';
import 'package:igricultor_app/private/widgets/product_checkout_card.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.green.shade700,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: CheckOutBottomBar(
            onBuy: () => Navigator.pushNamed(
              context,
              '/checkout-success',
            ),
          ),
        ),
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
          ],
        ),
      ),
    );
  }
}
