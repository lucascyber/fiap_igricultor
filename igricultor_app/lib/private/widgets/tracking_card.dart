import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A caminho',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.boxOpen,
                    size: 14,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Objeto empacotado',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '22/11/2021',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.plane,
                    size: 14,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Objeto a caminho',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '23/11/2021',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
