part of 'cart_tab_cubit.dart';

enum CartTabStatus {
  loading,
  error,
  completed,
  payLoading,
  payCompleted,
}

class CartTabState extends Equatable {
  final CartTabStatus status;
  final Cart cart;
  final String errorMessage;

  const CartTabState({
    required this.status,
    this.cart = const Cart.empty(),
    this.errorMessage = '',
  });

  CartTabState copyWith({
    CartTabStatus? status,
    Cart? cart,
    String? errorMessage,
  }) {
    return CartTabState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        cart,
        errorMessage,
      ];
}
