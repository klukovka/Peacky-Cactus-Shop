import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import '../../config/router/app_auto_router.gr.dart';

enum MainMenuItemType {
  goods,
  orders,
  cart;

  String get label {
    switch (this) {
      case MainMenuItemType.orders:
        return 'Orders';
      case MainMenuItemType.goods:
        return 'Goods';
      case MainMenuItemType.cart:
        return 'Cart';
    }
  }

  PageRouteInfo get route {
    switch (this) {
      case MainMenuItemType.orders:
        return const OrdersRoute();
      case MainMenuItemType.goods:
        return const GoodsRoute();
      case MainMenuItemType.cart:
        return const CartRoute();
    }
  }

  IconData get iconData {
    switch (this) {
      case MainMenuItemType.orders:
        return FontAwesome.cc_visa;
      case MainMenuItemType.goods:
        return RpgAwesome.flowers;
      case MainMenuItemType.cart:
        return FontAwesome.shopping_basket;
    }
  }
}
