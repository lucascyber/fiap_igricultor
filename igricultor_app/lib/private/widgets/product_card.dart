import 'package:flutter/material.dart';
import 'package:igricultor_app/data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String? buttonTitle;
  final VoidCallback onBuy;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onBuy,
    this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(product.image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ProdutctLabelInfo(
                    label: 'Preço:',
                    info: product.price,
                  ),
                  const SizedBox(height: 8),
                  ProdutctLabelInfo(
                    label: 'Quantidade:',
                    info: product.weight,
                  ),
                  const SizedBox(height: 8),
                  ProdutctLabelInfo(
                    label: 'Frete:',
                    info: product.shipping,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green.shade700,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () => onBuy(),
                      child: Text(buttonTitle ?? 'COMPRAR'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProdutctLabelInfo extends StatelessWidget {
  final String label;
  final String info;

  const ProdutctLabelInfo({
    Key? key,
    required this.label,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          info,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
