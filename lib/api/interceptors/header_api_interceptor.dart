import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  HeaderApiInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.headers.map[Headers.contentTypeHeader]?.first
            .startsWith('text') ??
        false) {
      if (response.data.isNotEmpty) {
        response.data = jsonDecode(response.data as String);
      }
      return handler.next(response);
    }
    handler.next(response);
  }
}
