import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:igricultor_app/data/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final bool isFair = product.type == 'fair';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(product.name),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BuyForm(
            onBuy: () => {},
            isFair: isFair,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(product.image).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name} por ${product.price} a partir de ${product.weight}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ProductDetailLabel(
                  icon: FontAwesomeIcons.truck,
                  label: 'Frete:',
                  text: product.shipping,
                ),
                const SizedBox(height: 8),
                ProductDetailLabel(
                  icon: FontAwesomeIcons.seedling,
                  label: 'Safra:',
                  text: product.harvest,
                ),
                const SizedBox(height: 8),
                ProductDetailLabel(
                  icon: FontAwesomeIcons.weight,
                  label: 'Quantidade mínima:',
                  text: product.weight,
                ),
                const SizedBox(height: 8),
                const ProductDetailLabel(
                  icon: FontAwesomeIcons.storeAlt,
                  label: 'Vendas nesta safra:',
                  text: '1.500',
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'Avaliação da safra:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: RatingBar.builder(
                        initialRating: product.rating.toDouble(),
                        minRating: product.rating.toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemSize: 25,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) => {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VoidCallback onBuy;
  final bool isFair;

  BuyForm({
    Key? key,
    required this.onBuy,
    required this.isFair,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isFair) ...[
          _buildForm(),
          const SizedBox(width: 20),
        ],
        Expanded(
          flex: 7,
          child: SizedBox(
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
              child: Text(isFair ? 'COMPRAR' : 'NEGOCIAR'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForm() {
    return Expanded(
      flex: 3,
      child: Form(
        key: _formKey,
        child: TextFormField(
          decoration: _inputDecoration('Qtd.'),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.green.shade700,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ProductDetailLabel extends StatelessWidget {
  final String label;
  final String text;
  final IconData icon;

  const ProductDetailLabel({
    Key? key,
    required this.label,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.grey.shade800;

    return Row(
      children: [
        FaIcon(
          icon,
          size: 14,
          color: textColor,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
