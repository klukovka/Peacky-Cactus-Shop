import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/api/models/update_cart_request.dart';
import 'package:peacky_cactus_shop/models/cart.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../api/peacky_cactus_shop_api_client.dart';
import '../../../models/cactus_amount_short_info.dart';
import '../../../services/cart_service.dart';
import '../../core/base_cubit.dart';

part 'cart_tab_state.dart';

@injectable
class CartTabCubit extends BaseCubit<CartTabState> {
  final PeackyCactusShopApiClient _apiClient;
  final CartService _cartService;

  CartTabCubit(
    this._apiClient,
    this._cartService,
  ) : super(const CartTabState(
          status: CartTabStatus.loading,
        )) {
    init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: CartTabStatus.error,
    ));
  }

  Future<void> init({
    CartTabStatus completedStatus = CartTabStatus.completed,
    bool showLoading = false,
  }) async {
    if (showLoading) {
      emit(state.copyWith(status: CartTabStatus.loading));
    }
    await makeErrorHandledCall(() async {
      final deviceId = await PlatformDeviceId.getDeviceId;
      final request = UpdateCartRequest(
        deviceId: '$deviceId',
        products: _cartService.products,
      );
      await _apiClient.updateCart(request);
      final cart = await _apiClient.getCart('$deviceId');

      emit(state.copyWith(
        status: completedStatus,
        cart: cart,
      ));
    });
  }

  Future<void> updateProductAmount(
    CactusAmountShortInfo cactusAmountShortInfo,
  ) async {
    await makeErrorHandledCall(() async {
      await _cartService.updateElement(cactusAmountShortInfo);
      final cart = state.cart.updateProductAmount(cactusAmountShortInfo);

      emit(state.copyWith(cart: cart));
    });
  }

  Future<void> removeProduct(String cactusId) async {
    emit(state.copyWith(errorMessage: '-'));

    await makeErrorHandledCall(() async {
      await _cartService.removeFromCart(cactusId);
      final cart = state.cart.removeProduct(cactusId);

      emit(state.copyWith(cart: cart, errorMessage: ''));
    });
  }

  Future<void> pay() async {
    emit(state.copyWith(status: CartTabStatus.payLoading));
    await init(completedStatus: CartTabStatus.payCompleted);
  }
}
