import 'package:auto_route/auto_route.dart';
import 'package:peacky_cactus_shop/pages/main_page/tabs/cart_tab.dart';
import 'package:peacky_cactus_shop/pages/main_page/tabs/goods_tab.dart';
import 'package:peacky_cactus_shop/pages/main_page/tabs/orders_tab.dart';
import 'package:peacky_cactus_shop/pages/payment_page/payment_page.dart';

import '../../pages/main_page/main_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@CustomAutoRouter(
  replaceInRouteName: 'Page|Tab|View,Route',
  transitionsBuilder: _fadeIn,
  durationInMilliseconds: _durationInMilliseconds,
  routes: [
    AutoRoute(
      page: MainPage,
      path: '/main/',
      initial: true,
      children: [
        AutoRoute(
          page: GoodsTab,
          path: 'goods',
          initial: true,
          maintainState: false,
        ),
        AutoRoute(
          page: CartTab,
          path: 'cart',
          maintainState: false,
        ),
        AutoRoute(
          page: OrdersTab,
          path: 'orders',
          maintainState: false,
        ),
      ],
    ),
    AutoRoute(
      page: PaymentPage,
      path: '/payment',
    ),
  ],
)
class $AppAutoRouter {}
