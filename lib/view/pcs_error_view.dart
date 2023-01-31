import 'package:flutter/material.dart';

class PcsErrorView extends StatelessWidget {
  final VoidCallback onPressed;

  const PcsErrorView({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.replay_outlined),
          SizedBox(height: 16),
          Text('Reload'),
        ],
      ),
    );
  }
}
