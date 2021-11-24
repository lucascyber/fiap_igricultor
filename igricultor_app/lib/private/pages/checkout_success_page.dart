import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckoutSuccessPage extends StatefulWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  _CheckoutSuccessPageState createState() => _CheckoutSuccessPageState();
}

class _CheckoutSuccessPageState extends State<CheckoutSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.checkCircle,
              size: 50,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Pedido realizado',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                '/home',
              ),
              child: Text(
                'Voltar para o inicio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
