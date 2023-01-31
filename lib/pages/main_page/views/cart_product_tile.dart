import 'package:flutter/material.dart';
import 'package:peacky_cactus_shop/models/cactus_amount_full_info.dart';
import 'package:peacky_cactus_shop/models/cactus_amount_short_info.dart';

import '../../../view/pcs_network_image.dart';

class CartProductTile extends StatelessWidget {
  final CactusAmountFullInfo cactusAmountFullInfo;
  final ValueSetter<CactusAmountShortInfo> changeProductAmount;
  final ValueSetter<String> removeProduct;

  const CartProductTile({
    super.key,
    required this.cactusAmountFullInfo,
    required this.changeProductAmount,
    required this.removeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildImage(context),
                    const SizedBox(height: 12),
                    _buildPrice(context),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInfo(context),
              ),
            ],
          ),
          Positioned(
            top: -12,
            right: -12,
            child: _buildRemoveButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Text(
          cactusAmountFullInfo.cactus.name,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        _buildAmountChangeButtons(context),
      ],
    );
  }

  Widget _buildPrice(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Price: ',
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: '${cactusAmountFullInfo.costs} UAH',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountChangeButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRemoveItemButton(context),
        const SizedBox(width: 16),
        Text(
          '${cactusAmountFullInfo.amount}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: 16),
        _buildAddItemButton(context),
      ],
    );
  }

  Widget _buildAddItemButton(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.onBackground;
    final isEnabled =
        cactusAmountFullInfo.amount < cactusAmountFullInfo.cactus.amount;
    return FloatingActionButton.small(
      onPressed: isEnabled
          ? () {
              changeProductAmount(
                CactusAmountShortInfo(
                  cactus: cactusAmountFullInfo.cactus.id,
                  amount: cactusAmountFullInfo.amount + 1,
                ),
              );
            }
          : null,
      backgroundColor:
          isEnabled ? backgroundColor : backgroundColor.withOpacity(0.2),
      elevation: isEnabled ? 0 : 1,
      child: Icon(
        Icons.add,
        color: Theme.of(context).cardColor,
      ),
    );
  }

  Widget _buildRemoveItemButton(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.onBackground;

    final isEnabled = cactusAmountFullInfo.amount > 1;
    return FloatingActionButton.small(
      onPressed: isEnabled
          ? () {
              changeProductAmount(
                CactusAmountShortInfo(
                  cactus: cactusAmountFullInfo.cactus.id,
                  amount: cactusAmountFullInfo.amount - 1,
                ),
              );
            }
          : null,
      backgroundColor:
          isEnabled ? backgroundColor : backgroundColor.withOpacity(0.2),
      elevation: isEnabled ? 0 : 1,
      child: Icon(
        Icons.remove,
        color: Theme.of(context).cardColor,
      ),
    );
  }

  Widget _buildRemoveButton(BuildContext context) {
    return IconButton(
      onPressed: () => removeProduct(cactusAmountFullInfo.cactus.id),
      icon: Icon(
        Icons.close,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: PcsNetworkImage(
        imageUrl: cactusAmountFullInfo.cactus.image,
      ),
    );
  }
}
