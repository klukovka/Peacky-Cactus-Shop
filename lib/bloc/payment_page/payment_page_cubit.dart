import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/api/models/payment_request.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../api/peacky_cactus_shop_api_client.dart';
import '../../services/cart_service.dart';
import '../core/base_cubit.dart';

part 'payment_page_state.dart';

@injectable
class PaymentPageCubit extends BaseCubit<PaymentPageState> {
  final PeackyCactusShopApiClient _apiClient;
  final CartService _cartService;

  PaymentPageCubit(this._apiClient, this._cartService)
      : super(const PaymentPageState(
          status: PaymentPageStatus.idle,
        ));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: PaymentPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void reload() {
    emit(state.copyWith(status: PaymentPageStatus.idle));
  }

  Future<void> pay({
    required String phone,
    required String card,
    required String cardExpMonth,
    required String cardExpYear,
    required String cardCvv,
    required String cardHolderName,
  }) async {
    emit(state.copyWith(status: PaymentPageStatus.loading));

    await makeErrorHandledCall(() async {
      final deviceId = await PlatformDeviceId.getDeviceId;

      final request = PaymentRequest(
        deviceId: '$deviceId',
        phone: '38$phone',
        card: card,
        cardExpMonth: cardExpMonth,
        cardExpYear: cardExpYear,
        cardCvv: cardCvv,
        cardHolderName: cardHolderName,
      );

      await _apiClient.payment(request);
    });

    if (state.status != PaymentPageStatus.error) {
      await _cartService.clear();
    }

    emit(state.copyWith(status: PaymentPageStatus.completed));
  }
}
