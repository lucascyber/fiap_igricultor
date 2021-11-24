import 'package:flutter/material.dart';
import 'package:igricultor_app/private/pages/order_list_page.dart';

class OrderListCard extends StatelessWidget {
  final OrderList order;

  const OrderListCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#${order.number}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildLabel(
              label: 'Data:',
              value: order.date,
            ),
            const SizedBox(height: 6),
            _buildLabel(
              label: 'Status:',
              value: order.status,
            ),
            const SizedBox(height: 6),
            _buildLabel(
              label: 'Valor:',
              value: order.total,
            ),
            const SizedBox(height: 6),
            _buildLabel(
              label: 'Pagamento:',
              value: order.payment,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel({required String label, required String value}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
