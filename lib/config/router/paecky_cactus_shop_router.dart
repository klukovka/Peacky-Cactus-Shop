import 'package:injectable/injectable.dart';

import '../di/injection_container.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

final router = locator<PeackyCactusShopRouter>();

@singleton
class PeackyCactusShopRouter extends BaseRouter {
  PeackyCactusShopRouter(AppAutoRouter router) : super(router);

  Future<void> pushPaymentPage() async {
    await push(const PaymentRoute());
  }
}
