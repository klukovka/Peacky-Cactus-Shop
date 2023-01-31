import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PcsSliverListGrid extends StatelessWidget {
  final SliverChildBuilderDelegate delegate;

  const PcsSliverListGrid({
    super.key,
    required this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    const crossAxisCount = 2;

    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverMasonryGrid(
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        delegate: delegate,
      ),
    );
  }
}
