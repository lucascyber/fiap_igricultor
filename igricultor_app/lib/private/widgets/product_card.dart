import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [Text(product.name)],
      ),
    );
  }
}
