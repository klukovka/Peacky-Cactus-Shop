import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peacky_cactus_shop/bloc/main_page/goods_tab/goods_tab_cubit.dart';
import 'package:peacky_cactus_shop/pages/main_page/views/product_card.dart';
import 'package:peacky_cactus_shop/view/pcs_error_view.dart';
import 'package:peacky_cactus_shop/view/pcs_loader.dart';
import 'package:peacky_cactus_shop/view/pcs_sliver_list_grid.dart';

import '../../../config/di/injection_container.dart';
import '../../../services/cart_service.dart';
import '../../../utils/toasts.dart';

class GoodsTab extends StatefulWidget implements AutoRouteWrapper {
  const GoodsTab({super.key});

  @override
  State<GoodsTab> createState() => _GoodsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<GoodsTabCubit>(),
      child: this,
    );
  }
}

class _GoodsTabState extends State<GoodsTab> {
  GoodsTabCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoodsTabCubit, GoodsTabState>(
      listener: (context, state) {
        if (state.status == GoodsTabStatus.error) {
          Toasts.of(context).showError(
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case GoodsTabStatus.error:
            return PcsErrorView(
              onPressed: cubit.init,
            );
          case GoodsTabStatus.loading:
            return const Center(child: PcsLoader());
          case GoodsTabStatus.completed:
          case GoodsTabStatus.idle:
            return _buildCompletedBody(state);
        }
      },
    );
  }

  Widget _buildCompletedBody(GoodsTabState state) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SafeArea(
            child: SizedBox.shrink(),
          ),
        ),
        PcsSliverListGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final product = state.products[index];

              return ProductCard(
                cactus: product,
                onPressed: locator<CartService>().inCart(product.id)
                    ? null
                    : () {
                        cubit.addToCart(product.id);
                        setState(() {});
                      },
              );
            },
            childCount: state.products.length,
          ),
        )
      ],
    );
  }
}
