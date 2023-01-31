// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../pages/main_page/main_page.dart' as _i1;
import '../../pages/main_page/tabs/cart_tab.dart' as _i4;
import '../../pages/main_page/tabs/goods_tab.dart' as _i3;
import '../../pages/main_page/tabs/orders_tab.dart' as _i5;
import '../../pages/payment_page/payment_page.dart' as _i2;

class AppAutoRouter extends _i6.RootStackRouter {
  AppAutoRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i2.PaymentPage()),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GoodsRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i3.GoodsTab()),
        maintainState: false,
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CartRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i4.CartTab()),
        maintainState: false,
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i5.OrdersTab()),
        maintainState: false,
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/main/',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/main/',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'goods',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              GoodsRoute.name,
              path: 'goods',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              CartRoute.name,
              path: 'cart',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              OrdersRoute.name,
              path: 'orders',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          PaymentRoute.name,
          path: '/payment',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.PaymentPage]
class PaymentRoute extends _i6.PageRouteInfo<void> {
  const PaymentRoute()
      : super(
          PaymentRoute.name,
          path: '/payment',
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i3.GoodsTab]
class GoodsRoute extends _i6.PageRouteInfo<void> {
  const GoodsRoute()
      : super(
          GoodsRoute.name,
          path: 'goods',
        );

  static const String name = 'GoodsRoute';
}

/// generated route for
/// [_i4.CartTab]
class CartRoute extends _i6.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i5.OrdersTab]
class OrdersRoute extends _i6.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: 'orders',
        );

  static const String name = 'OrdersRoute';
}
