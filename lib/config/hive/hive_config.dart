import 'package:hive_flutter/hive_flutter.dart';

import '../../models/cactus_amount_short_info.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CactusAmountShortInfoAdapter());
}
