import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peacky_cactus_shop/models/order.dart';
import 'package:peacky_cactus_shop/view/pcs_network_image.dart';
import 'package:sizer/sizer.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).cardColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '№ ${order.id}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'Date: ${DateFormat('dd.MM.yyyy HH:mm').format(order.date)}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          _buildTotalPrice(context)
        ],
      ),
      children: order.products.map((product) {
        return ListTile(
          title: Text(product.cactus.name),
          subtitle: Text(product.costsLabel),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.w),
            child: PcsNetworkImage(
              imageUrl: product.cactus.image,
              width: 12.w,
              height: 12.w,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTotalPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          '${order.costs} UAH',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
