import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/api/peacky_cactus_shop_api_client.dart';
import 'package:peacky_cactus_shop/models/order.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../core/base_cubit.dart';

part 'orders_tab_state.dart';

@injectable
class OrdersTabCubit extends BaseCubit<OrdersTabState> {
  final PeackyCactusShopApiClient _apiClient;

  OrdersTabCubit(this._apiClient)
      : super(const OrdersTabState(
          status: OrdersTabStatus.loading,
        )) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(status: OrdersTabStatus.loading));

    await makeErrorHandledCall(() async {
      final deviceId = await PlatformDeviceId.getDeviceId;

      final orders = await _apiClient.getOrders('$deviceId');
      emit(state.copyWith(
        status: OrdersTabStatus.completed,
        orders: orders..sort((a, b) => b.date.compareTo(a.date)),
      ));
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: OrdersTabStatus.error,
      errorMessage: errorMessage,
    ));
  }
}
