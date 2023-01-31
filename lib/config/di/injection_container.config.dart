// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../api/interceptors/header_api_interceptor.dart' as _i5;
import '../../api/peacky_cactus_shop_api_client.dart' as _i8;
import '../../bloc/main_page/cart_tab/cart_tab_cubit.dart' as _i9;
import '../../bloc/main_page/goods_tab/goods_tab_cubit.dart' as _i10;
import '../../bloc/main_page/orders_tab/orders_tab_cubit.dart' as _i11;
import '../../bloc/payment_page/payment_page_cubit.dart' as _i12;
import '../../services/cart_service.dart' as _i4;
import '../router/app_auto_router.gr.dart' as _i3;
import '../router/paecky_cactus_shop_router.dart' as _i6;
import 'module/api_module.dart' as _i14;
import 'module/router_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final routerModule = _$RouterModule();
  final apiModule = _$ApiModule();
  gh.singleton<_i3.AppAutoRouter>(routerModule.appAutoRouter());
  await gh.singletonAsync<_i4.CartService>(
    () => _i4.CartService.getInstance(),
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i5.HeaderApiInterceptor>(() => _i5.HeaderApiInterceptor());
  gh.singleton<_i6.PeackyCactusShopRouter>(
      _i6.PeackyCactusShopRouter(get<_i3.AppAutoRouter>()));
  gh.lazySingleton<_i7.Dio>(
      () => apiModule.baseDio(get<_i5.HeaderApiInterceptor>()));
  gh.lazySingleton<_i8.PeackyCactusShopApiClient>(
      () => apiModule.apiClient(get<_i7.Dio>()));
  gh.factory<_i9.CartTabCubit>(() => _i9.CartTabCubit(
        get<_i8.PeackyCactusShopApiClient>(),
        get<_i4.CartService>(),
      ));
  gh.factory<_i10.GoodsTabCubit>(() => _i10.GoodsTabCubit(
        get<_i8.PeackyCactusShopApiClient>(),
        get<_i4.CartService>(),
      ));
  gh.factory<_i11.OrdersTabCubit>(
      () => _i11.OrdersTabCubit(get<_i8.PeackyCactusShopApiClient>()));
  gh.factory<_i12.PaymentPageCubit>(() => _i12.PaymentPageCubit(
        get<_i8.PeackyCactusShopApiClient>(),
        get<_i4.CartService>(),
      ));
  return get;
}

class _$RouterModule extends _i13.RouterModule {}

class _$ApiModule extends _i14.ApiModule {}
