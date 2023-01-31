import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peacky_cactus_shop/config/router/paecky_cactus_shop_router.dart';
import 'package:peacky_cactus_shop/pages/main_page/views/cart_product_tile.dart';
import 'package:peacky_cactus_shop/view/payment_button.dart';

import '../../../bloc/main_page/cart_tab/cart_tab_cubit.dart';
import '../../../config/di/injection_container.dart';
import '../../../utils/toasts.dart';
import '../../../view/pcs_error_view.dart';
import '../../../view/pcs_loader.dart';

class CartTab extends StatefulWidget implements AutoRouteWrapper {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<CartTabCubit>(),
      child: this,
    );
  }
}

class _CartTabState extends State<CartTab> {
  CartTabCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartTabCubit, CartTabState>(
      listener: (context, state) async {
        if (state.status == CartTabStatus.payCompleted) {
          await router.pushPaymentPage();
          cubit.init(showLoading: true);
        }
        if (state.status == CartTabStatus.error) {
          Toasts.of(context).showError(
            message: state.errorMessage,
          );
        }
      },
      child: BlocBuilder<CartTabCubit, CartTabState>(
        builder: (context, state) {
          switch (state.status) {
            case CartTabStatus.error:
              return PcsErrorView(
                onPressed: cubit.init,
              );
            case CartTabStatus.loading:
              return const Center(child: PcsLoader());
            case CartTabStatus.completed:
            case CartTabStatus.payCompleted:
            case CartTabStatus.payLoading:
              return _buildCompletedBody(state);
          }
        },
      ),
    );
  }

  Widget _buildCompletedBody(CartTabState state) {
    if (state.cart.products.isEmpty) {
      return const Center(
        child: Text('Cart is empty'),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          ...state.cart.products.map((product) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CartProductTile(
                cactusAmountFullInfo: product,
                changeProductAmount: cubit.updateProductAmount,
                removeProduct: cubit.removeProduct,
              ),
            );
          }),
          const SizedBox(height: 16),
          _buildTotalPrice(state),
          const SizedBox(height: 16),
          _buildPayButton(state),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTotalPrice(CartTabState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          '${state.cart.costs} UAH',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }

  Widget _buildPayButton(CartTabState state) {
    return PaymentButton(
      onPressed: cubit.pay,
      isLoading: state.status == CartTabStatus.payLoading,
    );
  }
}
