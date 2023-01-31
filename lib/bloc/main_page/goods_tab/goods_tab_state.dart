part of 'goods_tab_cubit.dart';

enum GoodsTabStatus {
  loading,
  error,
  completed,
  idle,
}

class GoodsTabState extends Equatable {
  final GoodsTabStatus status;
  final List<Cactus> products;
  final String errorMessage;

  const GoodsTabState({
    required this.status,
    this.products = const [],
    this.errorMessage = '',
  });

  GoodsTabState copyWith({
    GoodsTabStatus? status,
    List<Cactus>? products,
    String? errorMessage,
  }) {
    return GoodsTabState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, products, errorMessage];
}
