import 'package:flutter/material.dart';

class Toasts {
  final BuildContext context;

  Toasts.of(this.context);

  SnackBar _buildSnackBar({
    required String message,
    required TextStyle? style,
    Widget? icon,
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: DismissDirection.endToStart,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              style: style,
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      message: message,
      backgroundColor: Theme.of(context).primaryColorDark,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showError({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.onError,
      ),
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Theme.of(context).colorScheme.onError),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
