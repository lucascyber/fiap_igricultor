// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/data/services/products_service.dart';
import 'package:igricultor_app/private/widgets/product_card.dart';

class CommercePage extends StatefulWidget {
  const CommercePage({Key? key}) : super(key: key);

  @override
  State<CommercePage> createState() => _CommercePageState();
}

class _CommercePageState extends State<CommercePage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    ProductsService.getShowCase()
        .then((data) => {
              setState(() {
                _products = data.categories[1].products.toList();
              })
            })
        .onError((error, stackTrace) => {
              print(error),
            });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.58,
      padding: const EdgeInsets.all(16),
      children: _products
          .map(
            (product) => ProductCard(
              product: product,
              buttonTitle: 'NEGOCIAR',
              onBuy: () => Navigator.pushNamed(
                context,
                '/chat-detail',
                arguments: product,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              ),
            ),
          )
          .toList(),
    );
  }
}
