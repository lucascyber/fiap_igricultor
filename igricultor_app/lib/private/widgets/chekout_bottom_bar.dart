import 'package:flutter/material.dart';

class CheckOutBottomBar extends StatelessWidget {
  final VoidCallback onBuy;

  const CheckOutBottomBar({
    Key? key,
    required this.onBuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.green.shade700,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onPressed: () => onBuy(),
        child: const Text('FINALIZAR PEDIDO'),
      ),
    );
  }
}
