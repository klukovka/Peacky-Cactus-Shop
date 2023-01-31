import 'package:dio/dio.dart';
import 'package:peacky_cactus_shop/api/models/update_cart_request.dart';
import 'package:peacky_cactus_shop/models/cactus.dart';
import 'package:peacky_cactus_shop/models/cart.dart';
import 'package:peacky_cactus_shop/models/order.dart';
import 'package:retrofit/http.dart';

import 'api_constants.dart';
import 'models/payment_request.dart';

part 'peacky_cactus_shop_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.hostApi)
abstract class PeackyCactusShopApiClient {
  factory PeackyCactusShopApiClient(
    Dio dio, {
    String baseUrl,
  }) = _PeackyCactusShopApiClient;

  @GET('/products')
  Future<List<Cactus>> getProducts();

  @POST('/cart')
  Future<void> updateCart(
    @Body() UpdateCartRequest request,
  );

  @GET('/cart/{deviceId}')
  Future<Cart> getCart(
    @Path('deviceId') String deviceId,
  );

  @POST('/pay')
  Future<void> payment(
    @Body() PaymentRequest request,
  );

  @GET('/orders/{deviceId}')
  Future<List<Order>> getOrders(
    @Path('deviceId') String deviceId,
  );
}
