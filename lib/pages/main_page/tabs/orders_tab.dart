import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peacky_cactus_shop/pages/main_page/views/order_tile.dart';

import '../../../bloc/main_page/orders_tab/orders_tab_cubit.dart';
import '../../../config/di/injection_container.dart';
import '../../../utils/toasts.dart';
import '../../../view/pcs_error_view.dart';
import '../../../view/pcs_loader.dart';

class OrdersTab extends StatefulWidget implements AutoRouteWrapper {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<OrdersTabCubit>(),
      child: this,
    );
  }
}

class _OrdersTabState extends State<OrdersTab> {
  OrdersTabCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersTabCubit, OrdersTabState>(
      listener: (context, state) {
        if (state.status == OrdersTabStatus.error) {
          Toasts.of(context).showError(
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case OrdersTabStatus.error:
            return PcsErrorView(
              onPressed: cubit.init,
            );
          case OrdersTabStatus.loading:
            return const Center(child: PcsLoader());
          case OrdersTabStatus.completed:
            return _buildCompletedBody(state);
        }
      },
    );
  }

  Widget _buildCompletedBody(OrdersTabState state) {
    if (state.orders.isEmpty) {
      return const Center(
        child: Text('You don\'t have any orders'),
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderTile(order: state.orders[index]);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: state.orders.length,
    );
  }
}
