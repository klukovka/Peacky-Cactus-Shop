import 'package:flutter/material.dart';
import 'package:peacky_cactus_shop/paecky_cactus_shop_app.dart';

import 'config/di/injection_container.dart';
import 'config/hive/hive_config.dart';

Future<void> main() async {
  await initHive();
  await configureDependencies();

  runApp(const PeackyCactusShopApp());
}
