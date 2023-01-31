import 'package:flutter/material.dart';
import 'package:peacky_cactus_shop/models/cactus.dart';
import 'package:peacky_cactus_shop/view/pcs_network_image.dart';

class ProductCard extends StatelessWidget {
  final Cactus cactus;
  final VoidCallback? onPressed;

  const ProductCard({
    super.key,
    required this.cactus,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildImage(context),
          const SizedBox(height: 16),
          Text(
            cactus.name,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          _buildPrice(context),
          if (cactus.isAvailable) ...[
            const SizedBox(height: 16),
            _buildAddToCartButton(context),
          ],
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          onPressed != null ? 'Add to cart' : 'Added',
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          PcsNetworkImage(
            imageUrl: cactus.image,
          ),
          cactus.isAvailable
              ? _buildAvailableLabel(context)
              : _buildNotAvailableLabel(context),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Text(
      '${cactus.cost} UAH',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _buildNotAvailableLabel(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onError,
          ),
          Text(
            'Not available',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onError,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableLabel(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          Text(
            'Available: ${cactus.amount}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
