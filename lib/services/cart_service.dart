import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/models/cactus_amount_short_info.dart';

@singleton
@preResolve
class CartService {
  static const _cactusAmountBoxKey = '_cactusAmountBoxKey';
  final Box<CactusAmountShortInfo> _box;

  CartService._(this._box);

  @factoryMethod
  static Future<CartService> getInstance() async {
    final cactusAmountBox =
        await Hive.openBox<CactusAmountShortInfo>(_cactusAmountBoxKey);

    return CartService._(cactusAmountBox);
  }

  @disposeMethod
  void dispose() {
    _box.close();
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> addToCart(String cactus) async {
    final selected = _box.values.toList().firstWhere(
          (element) => element.cactus == cactus,
          orElse: () => CactusAmountShortInfo(
            cactus: cactus,
            amount: 0,
          ),
        );
    await removeFromCart(cactus);
    await _box.add(selected.copyWith(amount: selected.amount + 1));
    log(_box.values.toString());
  }

  Future<void> removeFromCart(String cactus) async {
    final values = _box.values.toList()
      ..removeWhere(
        (element) {
          return element.cactus == cactus;
        },
      );

    await clear();
    _box.addAll(values);
    log(_box.values.toString());
  }

  List<CactusAmountShortInfo> get products {
    return _box.values.toList();
  }

  bool inCart(String cactus) {
    return _box.values.contains(CactusAmountShortInfo(
      cactus: cactus,
      amount: 0,
    ));
  }

  Future<void> updateElement(
    CactusAmountShortInfo cactusAmountShortInfo,
  ) async {
    await removeFromCart(cactusAmountShortInfo.cactus);
    await _box.add(cactusAmountShortInfo);
  }
}
