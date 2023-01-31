import 'package:injectable/injectable.dart';
import 'package:peacky_cactus_shop/config/router/app_auto_router.gr.dart';

@module
abstract class RouterModule {
  @singleton
  AppAutoRouter appAutoRouter() => AppAutoRouter();
}
