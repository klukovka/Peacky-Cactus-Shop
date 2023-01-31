import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:peacky_cactus_shop/view/pcs_loader.dart';
import 'package:sizer/sizer.dart';

class PaymentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const PaymentButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: isLoading
          ? PcsLoader(size: 8.w)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesome.credit_card),
                SizedBox(width: 16),
                Text(
                  'Pay',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
    );
  }
}
