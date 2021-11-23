// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';
import 'package:igricultor_app/data/services/products_service.dart';
import 'package:igricultor_app/private/widgets/product_card.dart';

class FairPage extends StatefulWidget {
  const FairPage({Key? key}) : super(key: key);

  @override
  State<FairPage> createState() => _FairPageState();
}

class _FairPageState extends State<FairPage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    ProductsService.getShowCase()
        .then((data) => {
              setState(() {
                _products = data.categories[0].products.toList();
              })
            })
        .onError((error, stackTrace) => {
              print(error),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _products
          .map(
            (product) => ProductCard(
              product: product,
            ),
          )
          .toList(),
    );
  }
}
