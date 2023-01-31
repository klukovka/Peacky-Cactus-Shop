import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../api/interceptors/header_api_interceptor.dart';
import '../../../api/peacky_cactus_shop_api_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio baseDio(HeaderApiInterceptor generalInterceptor) {
    return Dio()
      ..options.sendTimeout = 10000
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(generalInterceptor);
  }

  @lazySingleton
  PeackyCactusShopApiClient apiClient(Dio dio) =>
      PeackyCactusShopApiClient(dio);
}
