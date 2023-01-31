import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/api/peacky_cactus_shop_api_client.dart';
import 'package:peacky_cactus_shop/models/cactus.dart';
import 'package:peacky_cactus_shop/services/cart_service.dart';

import '../../core/base_cubit.dart';

part 'goods_tab_state.dart';

@injectable
class GoodsTabCubit extends BaseCubit<GoodsTabState> {
  final PeackyCactusShopApiClient _apiClient;
  final CartService _cartService;

  GoodsTabCubit(
    this._apiClient,
    this._cartService,
  ) : super(const GoodsTabState(
          status: GoodsTabStatus.loading,
        )) {
    init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: GoodsTabStatus.error,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: GoodsTabStatus.loading));

    await makeErrorHandledCall(() async {
      final products = await _apiClient.getProducts();
      emit(state.copyWith(
        status: GoodsTabStatus.completed,
        products: products,
      ));
    });
  }

  Future<void> addToCart(String cactus) async {
    await makeErrorHandledCall(() async {
      await _cartService.addToCart(cactus);
    });
  }
}
